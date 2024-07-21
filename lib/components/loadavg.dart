import 'dart:io';

import 'package:fdls/constants.dart';
import 'package:fdls/widgets/component.dart';
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

    if (history.length > _historyLength) {
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
      width: fdlsSmallComponentWidth,
      value: loadAvg,
      builder: (history) {
        return Stack(
          children: [
            Positioned.fill(
              child: SimpleGraph(
                span: _historyLength,
                length: history.length,
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
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: TwoRow(
                color: Colors.blue,
                icon: const Icon(Icons.speed),
                top: Text(
                  "${(history.last.min1 / history.last.numCpu * 100).round()}%",
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.visible,
                  softWrap: false,
                  maxLines: 1,
                  // style: Theme.of(context).textTheme.bodySmall,
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
