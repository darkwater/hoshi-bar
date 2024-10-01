import 'package:hoshi_bar/widgets/component.dart';
import 'package:hoshi_bar/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock.g.dart';

enum UpdateFrequency {
  second,
  minute,
}

@riverpod
String clockFormat(ClockFormatRef ref) {
  return "HH:mm";
}

@riverpod
UpdateFrequency clockUpdateFrequency(ClockUpdateFrequencyRef ref) {
  return ref.watch(clockFormatProvider).contains('ss')
      ? UpdateFrequency.second
      : UpdateFrequency.minute;
}

@riverpod
Stream<DateTime> clockStream(ClockStreamRef ref) async* {
  yield DateTime.now();

  final frequency = ref.watch(clockUpdateFrequencyProvider);

  while (true) {
    if (frequency == UpdateFrequency.second) {
      await Future.delayed(
        Duration(milliseconds: 1000 - DateTime.now().millisecond),
      );
    } else {
      await Future.delayed(
        Duration(
          seconds: 59 - DateTime.now().second,
          milliseconds: 1000 - DateTime.now().millisecond,
        ),
      );
    }

    yield DateTime.now();
  }
}

class ClockComponent extends ConsumerWidget {
  const ClockComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Component.asyncValue(
      primaryColor: Colors.amber,
      value: ref.watch(clockStreamProvider),
      builder: (context, time) => TwoRow(
        top: Text(
          DateFormat(ref.watch(clockFormatProvider)).format(time),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 18,
            height: 1,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
        bottom: Text(
          DateFormat("EEE dd MMM").format(time),
        ),
      ),
    );
  }
}
