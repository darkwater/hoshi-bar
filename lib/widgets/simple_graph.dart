import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleGraph extends StatelessWidget {
  /// Amount of samples to account for (controls minX and maxX)
  final int span;

  /// Amount of actual samples to display
  final int length;

  final double maxY;
  final List<LineChartBarData> data;

  const SimpleGraph({
    required this.span,
    required this.length,
    required this.maxY,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineTouchData: const LineTouchData(enabled: false),
        titlesData: const FlTitlesData(show: false),
        gridData: const FlGridData(show: false),
        clipData: const FlClipData.all(),
        borderData: FlBorderData(show: false),
        minY: 0,
        maxY: maxY,
        minX: length - span + 1,
        maxX: length - 1,
        lineBarsData: data,
      ),
      duration: Duration.zero,
    );
  }
}
