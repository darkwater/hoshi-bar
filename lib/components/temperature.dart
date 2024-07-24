import 'dart:math';

import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/hwmon.dart';
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

const _historyLength = 60;
const _longHistoryLength = 300;

@riverpod
Stream<Map<SysfsHwmon, List<Temperature>>> temperatureStream(
    TemperatureStreamRef ref) async* {
  final sensors = (await SysfsHwmon.list()).where((e) => e.maxTemp != null);

  final series = <SysfsHwmon, List<Temperature>>{
    for (final sensor in sensors) sensor: []
  };

  while (true) {
    for (final sensor in sensors) {
      series[sensor]!.add(Temperature(
        temperature: sensor.maxTemp!,
      ));

      if (series[sensor]!.length > _longHistoryLength) {
        series[sensor]!.removeAt(0);
      }
    }

    yield series;

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
      onHoverBuilder: (context) => const TemperatureHover(),
      onTap: () => print("tapped"),
      builder: (context, history) {
        final series = history.entries.toList();
        series.sort((a, b) =>
            a.value.last.temperature.compareTo(b.value.last.temperature));

        final hottest = series.last;

        return Stack(
          children: [
            Positioned.fill(
              child: SimpleGraph(
                span: _historyLength,
                length: hottest.value.length,
                minY: 20,
                maxY: 100,
                data: [
                  LineChartBarData(
                    spots: hottest.value
                        .toList()
                        .asMap()
                        .entries
                        .map((e) =>
                            FlSpot(e.key.toDouble(), e.value.temperature))
                        .toList(),
                    isCurved: false,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: TwoRow(
                icon: const Icon(Icons.thermostat),
                top: Text("${hottest.value.last.temperature.round()}°C"),
                bottom: Text(
                  hottest.key.name,
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

class TemperatureHover extends ConsumerWidget {
  const TemperatureHover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(temperatureStreamProvider);

    if (!data.hasValue) return const SizedBox();

    final series = data.requireValue;

    return ComponentHoverPopup(
      icon: Icons.speed,
      title: "System Load",
      width: 400,
      height: 300,
      underTitle: [
        for (final entry in series.entries)
          Text(
            "${entry.key.name}:  ${entry.value.last.temperature.round()}°C",
          ),
      ],
      background: SimpleGraph(
        span: _longHistoryLength,
        length: min(series.entries.first.value.length, _longHistoryLength),
        minY: 20,
        maxY: 100,
        data: series.entries
            .map(
              (entry) => LineChartBarData(
                spots: entry.value
                    .asMap()
                    .entries
                    .map((e) => FlSpot(e.key.toDouble(), e.value.temperature))
                    .toList(),
                isCurved: false,
                barWidth: 1.2,
                dotData: const FlDotData(show: false),
                color: Theme.of(context).primaryColor,
                belowBarData: BarAreaData(
                  show: true,
                  color: Theme.of(context).primaryColor.withOpacity(0.02),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
