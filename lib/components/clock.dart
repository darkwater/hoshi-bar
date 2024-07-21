import 'package:fdls/widgets/component.dart';
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
        Duration(milliseconds: 999 - DateTime.now().millisecond),
      );
    } else {
      await Future.delayed(
        Duration(
          seconds: 59 - DateTime.now().second,
          milliseconds: 999 - DateTime.now().millisecond,
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
      value: ref.watch(clockStreamProvider),
      builder: (time) => Column(
        children: [
          Text(
            DateFormat(ref.watch(clockFormatProvider)).format(time),
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
            ),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
          Text(
            DateFormat("EEE dd MMM").format(time),
            strutStyle: const StrutStyle(
              forceStrutHeight: true,
            ),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}
