import 'dart:io';

import 'package:fdls/constants.dart';
import 'package:fdls/utils/history.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/component_hover_popup.dart';
import 'package:fdls/widgets/simple_graph.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loadavg.g.dart';
part 'loadavg.freezed.dart';

@riverpod
Stream<History<void, LoadAvg>> loadAvgStream(LoadAvgStreamRef ref) async* {
  final cpuinfo = await File("/proc/cpuinfo").readAsString();
  final numCpu =
      cpuinfo.split("\n").where((e) => e.startsWith("processor\t")).length;

  final history = History<void, LoadAvg>();

  while (true) {
    final fields = (await File("/proc/loadavg").readAsString()).split(" ");
    history.addValue(
      null,
      LoadAvg(
        min1: double.parse(fields[0]),
        min5: double.parse(fields[1]),
        min15: double.parse(fields[2]),
        running: int.parse(fields[3].split("/").first),
        total: int.parse(fields[3].split("/").last),
        pid: int.parse(fields[4]),
        numCpu: numCpu,
      ),
    );

    yield history;

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@freezed
class LoadAvg with _$LoadAvg {
  const factory LoadAvg({
    required double min1,
    required double min5,
    required double min15,
    required int running,
    required int total,
    required int pid,
    required int numCpu,
  }) = _LoadAvg;
}

class LoadAvgComponent extends ConsumerWidget {
  const LoadAvgComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadAvg = ref.watch(loadAvgStreamProvider);

    return Component.asyncValue(
      primaryColor: Colors.blue,
      width: fdlsSmallComponentWidth,
      value: loadAvg,
      popup: const LoadAvgHover(),
      builder: (context, history) {
        return Stack(
          children: [
            Positioned.fill(child: _LoadAvgGraph(history, detailed: false)),
            Positioned.fill(
              child: TwoRow(
                icon: const Icon(Icons.speed),
                top: Text(
                  "${(history[null].lastValue!.min1 / history[null].lastValue!.numCpu * 100).round()}%",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.visible,
                  softWrap: false,
                  maxLines: 1,
                ),
                bottom: const SizedBox(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _LoadAvgGraph extends StatelessWidget {
  final History<void, LoadAvg> history;
  final bool detailed;

  const _LoadAvgGraph(this.history, {required this.detailed});

  @override
  Widget build(BuildContext context) {
    return SimpleGraph(
      maxY: history[null].lastValue!.numCpu.toDouble(),
      data: [
        LineChartBarData(
          spots: history[null].toSpots((v) => v.min1),
          isCurved: false,
          barWidth: 0,
          dotData: const FlDotData(show: false),
          color: Theme.of(context).primaryColor,
          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}

class LoadAvgHover extends ConsumerWidget {
  const LoadAvgHover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadAvg = ref.watch(loadAvgStreamProvider);

    if (!loadAvg.hasValue) return const SizedBox();

    final history = loadAvg.requireValue;

    return ComponentHoverPopup(
      icon: Icons.speed,
      title: "System Load",
      underTitle: [
        Row(
          children: [
            const Text(
              "1 min:\n"
              "5 min:\n"
              "15 min:  ",
            ),
            Text(
              "${history[null].lastValue!.min1.toStringAsFixed(2)}\n"
              "${history[null].lastValue!.min5.toStringAsFixed(2)}\n"
              "${history[null].lastValue!.min15.toStringAsFixed(2)}",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ],
      background: _LoadAvgGraph(history, detailed: true),
    );
  }
}
