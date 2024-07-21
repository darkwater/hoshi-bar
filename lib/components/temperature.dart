import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/hwmon.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'temperature.g.dart';
part 'temperature.freezed.dart';

@riverpod
Stream<List<Temperature>> temperatureStream(TemperatureStreamRef ref) async* {
  final batteries =
      (await SysfsHwmon.list()).where((e) => e.temp1Input != null);

  while (true) {
    yield batteries
        .map((e) => Temperature(
              id: e.id,
              name: e.name,
              temperature: e.temp1Input ?? 0,
            ))
        .toList();

    await Future.delayed(const Duration(seconds: 5));
  }
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    required String id,
    required String name,
    required double temperature,
  }) = _Temperature;
}

class TemperatureComponent extends ConsumerWidget {
  const TemperatureComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devs = ref.watch(temperatureStreamProvider);

    return Component.asyncValue(
      width: fdlsSmallComponentWidth,
      value: devs,
      builder: (value) {
        value.sort((a, b) => a.temperature.compareTo(b.temperature));
        final dev = value.last;

        return TwoRow(
          icon: const Icon(Icons.thermostat),
          top: Text("${dev.temperature.round()}°C"),
          bottom: Text(
            dev.name,
            softWrap: false,
            overflow: TextOverflow.clip,
          ),
          color: Colors.orange,
        );
      },
    );
  }
}
