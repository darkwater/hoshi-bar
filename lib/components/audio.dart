import 'dart:convert';
import 'dart:io';

import 'package:hoshi_bar/constants.dart';
import 'package:hoshi_bar/widgets/component.dart';
import 'package:hoshi_bar/widgets/slider.dart';
import 'package:hoshi_bar/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio.g.dart';

@riverpod
Stream<PipewireStatus> pipewireStatus(PipewireStatusRef ref) async* {
  final pwdump = await Process.start("pw-dump", ["-m"]);
  final events = pwdump.stdout
      .transform(const AsciiDecoder(allowInvalid: true))
      .transform(const LineSplitter())
      .where((line) => line == "[")
      .asBroadcastStream();

  ref.onDispose(() => pwdump.kill());

  while (true) {
    await events.first;
    yield await PipewireStatus.wpctlStatus();
  }
}

@riverpod
PipewireSink? defaultSink(DefaultSinkRef ref) {
  final status = ref.watch(pipewireStatusProvider);
  return status.valueOrNull?.defaultSink;
}

class AudioComponent extends ConsumerWidget {
  const AudioComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sink = ref.watch(defaultSinkProvider);
    final volume = sink?.volume;

    return Component(
      primaryColor: Colors.green,
      width: hbSmallComponentWidth,
      clipBehavior: Clip.none,
      child: volume != null
          ? BarSlider(
              value: volume,
              builder: (context, volume) => (
                const Icon(Icons.volume_up),
                Text("${(volume * 100).round()}%"),
              ),
              onChanged: (volume) {
                Process.run("wpctl",
                    ["set-volume", sink!.id.toString(), volume.toString()]);
              },
            )
          : TwoRow(
              top: const Text("??"),
              icon: const Icon(Icons.volume_up),
              bottom: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                child: const LinearProgressIndicator(value: 0),
              ),
            ),
    );
  }
}

class PipewireStatus {
  final List<PipewireClient> clients;
  final List<PipewireDevice> devices;
  final List<PipewireSink> sinks;
  final List<PipewireSource> sources;
  final List<PipewireFilter> filters;
  final List<PipewireStream> streams;

  PipewireSink? get defaultSink => sinks.where((s) => s.default_).firstOrNull;

  PipewireStatus({
    required this.clients,
    required this.devices,
    required this.sinks,
    required this.sources,
    required this.filters,
    required this.streams,
  });

  static Future<PipewireStatus> wpctlStatus() async {
    final res = await Process.run("wpctl", ["status"]);
    final status = res.stdout as String;
    final lines = status.split("\n").iterator;
    lines.moveNext();

    RegExp pat;
    RegExpMatch? match;

    const indent = r"([\s│*]+)";
    const idName = r"(\d+)\. (.+?)\s*";
    const bracketed = r"(\[(.*)\])?";

    final itemPat = RegExp("^$indent$idName$bracketed\$");
    final volumePat = RegExp(r"vol: ([0-9.]+)\s*(MUTED)?");

    void find(String pattern) {
      pat = RegExp(pattern);
      while (!pat.hasMatch(lines.current)) {
        if (!lines.moveNext()) throw "Pattern not found: $pattern";
      }
      if (!lines.moveNext()) {
        throw "Pattern is all the way at the end: $pattern";
      }
    }

    find("^ .─ Clients:");

    final clients = <PipewireClient>[];
    while ((match = itemPat.firstMatch(lines.current)) != null) {
      clients.add(PipewireClient(
        id: int.parse(match!.group(2)!),
        name: match.group(3)!,
      ));
      lines.moveNext();
    }

    find("^ .─ Devices:");

    final devices = <PipewireDevice>[];
    while ((match = itemPat.firstMatch(lines.current)) != null) {
      devices.add(PipewireDevice(
        id: int.parse(match!.group(2)!),
        name: match.group(3)!,
        api: match.group(5)!,
      ));
      lines.moveNext();
    }

    find("^ .─ Sinks:");

    final sinks = <PipewireSink>[];
    while ((match = itemPat.firstMatch(lines.current)) != null) {
      final volumeMatch = volumePat.firstMatch(match!.group(5) ?? "");
      sinks.add(PipewireSink(
        id: int.parse(match.group(2)!),
        name: match.group(3)!,
        volume: double.parse(volumeMatch?.group(1) ?? "0"),
        muted: volumeMatch?.group(2) != null,
        default_: match.group(1)!.contains("*"),
      ));
      lines.moveNext();
    }

    find("^ .─ Sources:");

    final sources = <PipewireSource>[];
    while ((match = itemPat.firstMatch(lines.current)) != null) {
      final volumeMatch = volumePat.firstMatch(match!.group(5)!);
      sources.add(PipewireSource(
        id: int.parse(match.group(2)!),
        name: match.group(3)!,
        volume: double.parse(volumeMatch!.group(1)!),
        muted: volumeMatch.group(2) != null,
        default_: match.group(1)!.contains("*"),
      ));
      lines.moveNext();
    }

    find("^ .─ Filters:");

    lines.moveNext(); // - loopback-1234-26 wtf no im just ignoring this

    final filters = <PipewireFilter>[];
    while ((match = itemPat.firstMatch(lines.current)) != null) {
      filters.add(PipewireFilter(
        id: int.parse(match!.group(2)!),
        name: match.group(3)!,
        type: match.group(5)!,
        default_: match.group(1)!.contains("*"),
      ));
      lines.moveNext();
    }

    final streams = <PipewireStream>[]; // TODO

    return PipewireStatus(
      clients: clients,
      devices: devices,
      sinks: sinks,
      sources: sources,
      filters: filters,
      streams: streams,
    );
  }
}

class PipewireClient {
  final int id;
  final String name;

  PipewireClient({
    required this.id,
    required this.name,
  });
}

class PipewireDevice {
  final int id;
  final String name;
  final String api;

  PipewireDevice({
    required this.id,
    required this.name,
    required this.api,
  });
}

class PipewireSink {
  final int id;
  final String name;
  final double volume;
  final bool muted;
  final bool default_;

  PipewireSink({
    required this.id,
    required this.name,
    required this.volume,
    required this.muted,
    required this.default_,
  });
}

class PipewireSource {
  final int id;
  final String name;
  final double volume;
  final bool muted;
  final bool default_;

  PipewireSource({
    required this.id,
    required this.name,
    required this.volume,
    required this.muted,
    required this.default_,
  });
}

class PipewireFilter {
  final int id;
  final String name;
  final String type;
  final bool default_;

  PipewireFilter({
    required this.id,
    required this.name,
    required this.type,
    required this.default_,
  });
}

class PipewireStream {
  final int id;
  final String name;
  final List<PipewireStreamPort> ports;

  PipewireStream({
    required this.id,
    required this.name,
    required this.ports,
  });
}

class PipewireStreamPort {
  final int id;
  final PipewireStreamPortType type;
  final String name;
  final String? linkedPortName;
  final bool active;

  PipewireStreamPort({
    required this.id,
    required this.type,
    required this.name,
    required this.linkedPortName,
    required this.active,
  });
}

enum PipewireStreamPortType {
  input,
  output,
  monitor,
}
