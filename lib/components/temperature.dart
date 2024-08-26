import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/hwmon.dart';
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

part 'temperature.g.dart';
part 'temperature.freezed.dart';

@riverpod
Stream<History<(SysfsHwmon, String), double>> temperatureStream(
    TemperatureStreamRef ref) async* {
  final sensors = <(SysfsHwmon, String)>[];
  for (final sensor in await SysfsHwmon.list()) {
    if (await sensor.maxTemp != null) {
      sensors.add((sensor, await sensor.name));
    }
  }

  final history = History<(SysfsHwmon, String), double>();

  while (true) {
    for (final sensor in sensors) {
      history.addValue(sensor, (await sensor.$1.maxTemp)!);
    }

    yield history;

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    required double temperature,
  }) = _Temperature;
}

class TemperatureComponent extends ConsumerWidget {
  const TemperatureComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devs = ref.watch(temperatureStreamProvider);

    return Component.asyncValue(
      primaryColor: Colors.orange,
      width: fdlsSmallComponentWidth,
      value: devs,
      popup: const TemperatureHover(),
      builder: (context, history) {
        final hottest = history.seriesByMaxLast((v) => v);

        return Stack(
          children: [
            Positioned.fill(
              child: _TemperatureGraph(hottest: hottest),
            ),
            Positioned.fill(
              child: TwoRow(
                icon: const Icon(Icons.thermostat),
                top: Text("${hottest.lastValue!.round()}°C"),
                bottom: Text(
                  hottest.key.$2,
                  softWrap: false,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TemperatureGraph extends StatelessWidget {
  final History<(SysfsHwmon, String), double>? history;
  final Series<(SysfsHwmon, String), double>? hottest;

  const _TemperatureGraph({
    this.history,
    this.hottest,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleGraph(
      minY: 20,
      maxY: 100,
      data: [
        if (hottest != null)
          LineChartBarData(
            spots: hottest!.toSpots((v) => v),
            isCurved: false,
            barWidth: 0,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(context).primaryColor.withOpacity(0.4),
            ),
          ),
        if (history != null)
          for (final entry in history!.series.entries)
            LineChartBarData(
              spots: entry.value.toSpots((v) => v),
              isCurved: false,
              barWidth: 1.2,
              dotData: const FlDotData(show: false),
              color: Theme.of(context).primaryColor,
              belowBarData: BarAreaData(
                show: true,
                color: Theme.of(context).primaryColor.withOpacity(0.02),
              ),
            ),
      ],
    );
  }
}

class TemperatureHover extends ConsumerWidget {
  const TemperatureHover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(temperatureStreamProvider);

    if (!data.hasValue) return const SizedBox();

    final history = data.requireValue;

    return ComponentHoverPopup(
      icon: Icons.thermostat,
      title: "Temperature",
      underTitle: [
        for (final entry in history.series.entries)
          Text(
            "${entry.key.$2}:  ${entry.value.lastValue!.round()}°C",
          ),
      ],
      background: _TemperatureGraph(history: history),
    );
  }
}
