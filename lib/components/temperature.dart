import 'package:fdls/sysfs/hwmon.dart';
import 'package:fdls/widgets/component.dart';
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

    await Future.delayed(const Duration(seconds: 10));
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
      value: devs,
      builder: (value) {
        value.sort((a, b) => a.temperature.compareTo(b.temperature));
        final dev = value.last;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.thermostat,
                  size: 16,
                  color: Colors.orange,
                ),
                const SizedBox(width: 4),
                Text("${dev.temperature.round()} °C"),
              ],
            ),
            Text(
              dev.name,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        );
      },
    );
  }
}
