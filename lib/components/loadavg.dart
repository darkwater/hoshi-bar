import 'dart:io';
import 'dart:math';

import 'package:fdls/constants.dart';
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

const _historyLength = 60;
const _longHistoryLength = 300;

@riverpod
Stream<List<LoadAvg>> loadAvgStream(LoadAvgStreamRef ref) async* {
  final cpuinfo = await File("/proc/cpuinfo").readAsString();
  final numCpu =
      cpuinfo.split("\n").where((e) => e.startsWith("processor\t")).length;

  final history = <LoadAvg>[];

  while (true) {
    final fields = (await File("/proc/loadavg").readAsString()).split(" ");
    history.add(LoadAvg(
      min1: double.parse(fields[0]),
      min5: double.parse(fields[1]),
      min15: double.parse(fields[2]),
      running: int.parse(fields[3].split("/").first),
      total: int.parse(fields[3].split("/").last),
      pid: int.parse(fields[4]),
      numCpu: numCpu,
    ));

    if (history.length > _longHistoryLength) {
      history.removeAt(0);
    }

    yield history;

    await Future.delayed(const Duration(seconds: 1));
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
      onHoverBuilder: (context) => const LoadAvgHover(),
      onTap: () => print("tapped"),
      builder: (context, history) {
        return Stack(
          children: [
            Positioned.fill(
              child: SimpleGraph(
                span: _historyLength,
                length: min(history.length, _historyLength),
                maxY: history.last.numCpu.toDouble(),
                data: [
                  LineChartBarData(
                    spots: history
                        .skip(max(history.length - _historyLength, 0))
                        .take(_historyLength)
                        .toList()
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.min1))
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
                icon: const Icon(Icons.speed),
                top: Text(
                  "${(history.last.min1 / history.last.numCpu * 100).round()}%",
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
      width: 400,
      height: 300,
      underTitle: [
        Row(
          children: [
            const Text(
              "1 min:\n"
              "5 min:\n"
              "15 min:  ",
            ),
            Text(
              "${history.last.min1.toStringAsFixed(2)}\n"
              "${history.last.min5.toStringAsFixed(2)}\n"
              "${history.last.min15.toStringAsFixed(2)}",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
      ],
      background: SimpleGraph(
        span: _longHistoryLength,
        length: min(history.length, _longHistoryLength),
        maxY: history.last.numCpu.toDouble(),
        data: [
          LineChartBarData(
            spots: history
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value.min1))
                .toList(),
            isCurved: false,
            barWidth: 0,
            dotData: const FlDotData(show: false),
            color: Theme.of(context).primaryColor,
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
