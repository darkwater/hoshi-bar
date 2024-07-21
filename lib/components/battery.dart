import 'package:fdls/sysfs/sysfs.dart';
import 'package:fdls/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battery.g.dart';
part 'battery.freezed.dart';

@riverpod
Stream<List<Battery>> batteryStream(BatteryStreamRef ref) async* {
  final batteries = (await SysfsPowerSupply.list()).where((e) =>
      e.type == SysfsPowerSupplyType.battery && !e.name.startsWith("hid"));

  while (true) {
    yield batteries
        .map((e) => Battery(
              name: e.name,
              capacity: e.capacity,
              status: e.status,
            ))
        .toList();
    await Future.delayed(const Duration(seconds: 1));
  }
}

@freezed
class Battery with _$Battery {
  const factory Battery({
    required String name,
    required int capacity,
    required SysfsPowerSupplyStatus status,
  }) = _Battery;
}

class BatteryComponent extends ConsumerWidget {
  const BatteryComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final batteries = ref.watch(batteryStreamProvider);

    return Row(
      children: [
        ...(batteries.valueOrNull ?? []).map((battery) {
          // final color = battery.capacity > 0.2
          //     ? Colors.green
          //     : battery.capacity > 0.1
          //         ? Colors.orange
          //         : Colors.red;
          final color = switch (battery.status) {
            SysfsPowerSupplyStatus.charging ||
            SysfsPowerSupplyStatus.full =>
              Colors.blue,
            _ when battery.capacity > 0.2 => Colors.green,
            _ when battery.capacity > 0.1 => Colors.orange,
            _ => Colors.red,
          };

          return Component(
            width: 54,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.battery_std, size: 16, color: color),
                    Text("${battery.capacity}%"),
                  ],
                ),
                LinearProgressIndicator(
                  value: battery.capacity / 100,
                  valueColor: AlwaysStoppedAnimation<Color>(color),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
