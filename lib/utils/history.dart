import 'package:fdls/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';

class History<K, V> {
  Map<K, Series<K, V>> series = {};
  Duration keepHistory = fdlsDefaultKeepHistory;

  Series<K, V> operator [](K key) => getSeries(key);

  Series<K, V> getSeries(K key) {
    series[key] ??= Series<K, V>(key: key);
    return series[key]!;
  }

  void addValue(K key, V value) {
    final series = getSeries(key);
    series.data.add(DataPoint(DateTime.now(), value));

    final cutoffTime = DateTime.now().subtract(keepHistory);
    final cutoffIndex =
        series.data.indexWhere((e) => e.time.isAfter(cutoffTime));

    if (cutoffIndex > 0) {
      // keep one sample outside the cutoff so the graph looks unaffected
      series.data.removeRange(0, cutoffIndex - 1);
    }
  }

  Series<K, V> seriesByMaxLast(Comparable Function(V) selector) {
    final cloned = series.entries.toList();
    cloned.sort((a, b) => selector(a.value.data.last.value)
        .compareTo(selector(b.value.data.last.value)));

    return cloned.last.value;
  }
}

class Series<K, T> {
  final K key;
  List<DataPoint<T>> data = [];

  Series({required this.key});

  T? get lastValue => data.lastOrNull?.value;

  List<FlSpot> toSpots(double Function(T) y) {
    return data.map((e) => FlSpot(e.timeSeconds, y(e.value))).toList();
  }
}

@immutable
class DataPoint<T> {
  final double _time;
  final T value;

  DateTime get time =>
      DateTime.fromMillisecondsSinceEpoch((_time * 1000).round());

  double get timeSeconds => _time;

  DataPoint(DateTime time, this.value)
      : _time = time.millisecondsSinceEpoch / 1000;
}
