import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/net.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/simple_graph.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network.g.dart';
part 'network.freezed.dart';

const _historyLength = 100;
const _maxY = 500 * 1024 * 1024 / 8; // 500 Mbps
const _interval = fdlsUpdateFrequency;

@riverpod
Stream<List<NetworkUsage>> networkUsageStream(
  NetworkUsageStreamRef ref,
) async* {
  final devices = (await SysfsNet.list())
      .where((dev) => dev.id.startsWith("en") || dev.id.startsWith("wl"))
      .toList();

  final history = <NetworkUsage>[];

  while (true) {
    final nowRx = devices.fold<int>(0, (prev, dev) => prev + dev.rxBytes);
    final nowTx = devices.fold<int>(0, (prev, dev) => prev + dev.txBytes);

    final last = history.isNotEmpty ? history.last : null;
    final lastRx = last?.downBytes ?? nowRx;
    final lastTx = last?.upBytes ?? nowTx;

    history.add(
      NetworkUsage(
        id: "all",
        upBytes: nowTx,
        downBytes: nowRx,
        upRate: (nowTx - lastTx) / _interval.inSeconds,
        downRate: (nowRx - lastRx) / _interval.inSeconds,
      ),
    );

    if (history.length > _historyLength) {
      history.removeAt(0);
    }

    yield history;

    await Future.delayed(_interval);
  }
}

@freezed
class NetworkUsage with _$NetworkUsage {
  const factory NetworkUsage({
    required String id,
    required int upBytes,
    required int downBytes,
    required double upRate,
    required double downRate,
  }) = _NetworkUsage;

  const NetworkUsage._();

  String get downRateHuman => _humanSize(downRate);
  String get upRateHuman => _humanSize(upRate);
}

String _humanSize(double size) {
  if (size < 1024) {
    return "<1 K";
  } else if (size < 1024 * 1024) {
    return "${(size / 1024).toStringAsFixed(0)} K";
  } else if (size < 1024 * 1024 * 1024) {
    return "${(size / 1024 / 1024).toStringAsFixed(0)} M";
  } else {
    return "${(size / 1024 / 1024 / 1024).toStringAsFixed(0)} G";
  }
}

class NetworkComponent extends ConsumerWidget {
  const NetworkComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usage = ref.watch(networkUsageStreamProvider);

    return Component.asyncValue(
      primaryColor: Colors.green,
      width: fdlsMediumComponentWidth,
      value: usage,
      builder: (context, history) {
        return Stack(
          children: [
            Positioned.fill(
              child: SimpleGraph(
                span: _historyLength,
                length: history.length,
                maxY: _maxY,
                data: [
                  LineChartBarData(
                    spots: history
                        .asMap()
                        .entries
                        .map((e) =>
                            FlSpot(e.key.toDouble(), _maxY - e.value.upRate))
                        .toList(),
                    isCurved: false,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),
                    aboveBarData: BarAreaData(
                      show: true,
                      color: Colors.red.withOpacity(0.4),
                    ),
                  ),
                  LineChartBarData(
                    spots: history
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.downRate))
                        .toList(),
                    isCurved: false,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: TwoRow(
                top: Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_down, color: Colors.green),
                    Text(
                      history.last.downRateHuman,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                      maxLines: 1,
                      // style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      history.last.upRateHuman,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                      maxLines: 1,
                      // style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Icon(Icons.keyboard_arrow_up, color: Colors.red),
                  ],
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
