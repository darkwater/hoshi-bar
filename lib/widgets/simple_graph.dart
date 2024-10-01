import 'package:hoshi_bar/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wayland_shell/wayland_shell.dart';

class SimpleGraph<T> extends StatefulWidget {
  final double minY;
  final double maxY;
  final List<LineChartBarData> data;

  const SimpleGraph({
    required this.maxY,
    required this.data,
    this.minY = 0,
    super.key,
  });

  @override
  State<SimpleGraph<T>> createState() => _SimpleGraphState<T>();
}

class _SimpleGraphState<T> extends State<SimpleGraph<T>> {
  double width = 100;

  @override
  Widget build(BuildContext context) {
    return GlobalRect(
      onChange: (rect) {
        if (rect.width == width) return;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() => width = rect.width);
        });
      },
      child: LineChart(
        LineChartData(
          lineTouchData: const LineTouchData(enabled: false),
          titlesData: const FlTitlesData(show: false),
          gridData: const FlGridData(show: false),
          clipData: const FlClipData.all(),
          borderData: FlBorderData(show: false),
          minY: widget.minY,
          maxY: widget.maxY,
          minX: DateTime.now()
                  .subtract(hbGraphPer100Px * (width / 100))
                  .millisecondsSinceEpoch /
              1000,
          maxX: DateTime.now().millisecondsSinceEpoch / 1000,
          lineBarsData: widget.data,
        ),
        duration: Duration.zero,
      ),
    );
  }
}
