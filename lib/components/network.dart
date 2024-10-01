import 'package:hoshi_bar/constants.dart';
import 'package:hoshi_bar/sysfs/net.dart';
import 'package:hoshi_bar/utils/history.dart';
import 'package:hoshi_bar/widgets/component.dart';
import 'package:hoshi_bar/widgets/component_hover_popup.dart';
import 'package:hoshi_bar/widgets/simple_graph.dart';
import 'package:hoshi_bar/widgets/two_row.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'network.g.dart';
part 'network.freezed.dart';

const _maxY = 500 * 1024 * 1024 / 8; // 500 Mbps

const _total = "__total";

@riverpod
Stream<History<String, NetworkUsage>> networkUsageStream(
  NetworkUsageStreamRef ref,
) async* {
  final history = History<String, NetworkUsage>();

  DateTime last = DateTime.now().subtract(hbUpdateFrequency);

  while (true) {
    final devices = await SysfsNet.list();

    // final nowRx = devices.fold<int>(0, (prev, dev) => prev + dev.rxBytes);
    // final nowTx = devices.fold<int>(0, (prev, dev) => prev + dev.txBytes);

    // final last = history.isNotEmpty ? history.last : null;
    // final lastRx = last?.downBytes ?? nowRx;
    // final lastTx = last?.upBytes ?? nowTx;

    final elapsed = (DateTime.now().difference(last)).inMilliseconds / 1000;

    var totalRx = 0;
    var totalTx = 0;

    for (final dev in devices) {
      final nowRx = await dev.rxBytes;
      final nowTx = await dev.txBytes;

      totalRx += nowRx;
      totalTx += nowTx;

      final last = history[dev.id].lastValue;
      final lastRx = last?.downBytes ?? nowRx;
      final lastTx = last?.upBytes ?? nowTx;

      history.addValue(
        dev.id,
        NetworkUsage(
          id: "all",
          upBytes: nowTx,
          downBytes: nowRx,
          upRate: (nowTx - lastTx) / elapsed,
          downRate: (nowRx - lastRx) / elapsed,
        ),
      );
    }

    final lastV = history[_total].lastValue;
    final lastRx = lastV?.downBytes ?? totalRx;
    final lastTx = lastV?.upBytes ?? totalTx;

    history.addValue(
      _total,
      NetworkUsage(
        id: _total,
        upBytes: totalTx,
        downBytes: totalRx,
        upRate: (totalTx - lastTx) / elapsed,
        downRate: (totalRx - lastRx) / elapsed,
      ),
    );

    yield history;

    last = DateTime.now();

    await Future.delayed(hbUpdateFrequency);
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
      width: hbMediumComponentWidth,
      value: usage,
      popup: const NetworkHover(),
      builder: (context, history) {
        return Stack(
          children: [
            Positioned.fill(
              child: _NetworkGraph(history),
            ),
            Positioned.fill(
              child: TwoRow(
                top: Row(
                  children: [
                    const Icon(Icons.keyboard_arrow_down, color: Colors.green),
                    Text(
                      history[_total].lastValue!.downRateHuman,
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                      maxLines: 1,
                      // style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const Spacer(),
                    Text(
                      history[_total].lastValue!.upRateHuman,
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

class _NetworkGraph extends StatelessWidget {
  final History<String, NetworkUsage> history;

  const _NetworkGraph(this.history);

  @override
  Widget build(BuildContext context) {
    return SimpleGraph(
      maxY: _maxY,
      data: history.series.values
          .expand(
            (series) => [
              LineChartBarData(
                spots: series.toSpots((v) => _maxY - v.upRate),
                isCurved: false,
                barWidth: 0,
                dotData: const FlDotData(show: false),
                aboveBarData: BarAreaData(
                  show: true,
                  color: Colors.red.withOpacity(0.4),
                ),
              ),
              LineChartBarData(
                spots: series.toSpots((v) => v.downRate),
                isCurved: false,
                barWidth: 0,
                dotData: const FlDotData(show: false),
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.green.withOpacity(0.4),
                ),
              ),
            ],
          )
          .toList(),
    );
  }
}

class NetworkHover extends ConsumerWidget {
  const NetworkHover({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usage = ref.watch(networkUsageStreamProvider);

    if (!usage.hasValue) return const SizedBox();

    final history = usage.requireValue;

    return ComponentHoverPopup(
      icon: Icons.lan_outlined,
      title: "Network",
      background: _NetworkGraph(history),
    );
  }
}
