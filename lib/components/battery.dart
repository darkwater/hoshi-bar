import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/power_supply.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'battery.g.dart';
part 'battery.freezed.dart';

@riverpod
Stream<List<Battery>> batteryStream(BatteryStreamRef ref) async* {
  final batteries = <SysfsPowerSupply>[];
  for (final battery in await SysfsPowerSupply.list()) {
    if (await battery.type == SysfsPowerSupplyType.battery &&
        !battery.id.startsWith("hid")) {
      batteries.add(battery);
    }
  }

  while (true) {
    final out = <Battery>[];
    for (final battery in batteries) {
      out.add(Battery(
        id: battery.id,
        capacity: await battery.capacity,
        status: await battery.status,
      ));
    }

    yield out;

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@freezed
class Battery with _$Battery {
  const factory Battery({
    required String id,
    required double capacity,
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
          final color = switch (battery.status) {
            SysfsPowerSupplyStatus.charging ||
            SysfsPowerSupplyStatus.full =>
              Colors.blue,
            _ when battery.capacity > 0.30 => Colors.green,
            _ when battery.capacity > 0.15 => Colors.amber,
            _ => Colors.red,
          };

          final icon = switch (battery.status) {
            SysfsPowerSupplyStatus.charging => Icons.battery_charging_full,
            SysfsPowerSupplyStatus.discharging => Icons.battery_full,
            SysfsPowerSupplyStatus.notCharging => Icons.battery_unknown,
            SysfsPowerSupplyStatus.full => Icons.battery_full,
            _ => Icons.battery_unknown,
          };

          return Component(
            primaryColor: color,
            width: fdlsSmallComponentWidth,
            child: TwoRow(
              top: Text("${(battery.capacity * 100).round()}%"),
              icon: Icon(icon),
              bottom: LinearProgressIndicator(
                value: battery.capacity,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }),
      ],
    );
  }
}
