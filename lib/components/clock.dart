import 'package:fdls/widgets/component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class ClockComponent extends ConsumerWidget {
  const ClockComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
      stream: clockStream(),
      builder: (context, snapshot) {
        print(snapshot.data);
        return Component(
          child: Text(
            DateFormat('HH:mm:ss').format(snapshot.data!),
            style: const TextStyle(
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
        );
      },
    );
  }
}

Stream<DateTime> clockStream() async* {
  yield DateTime.now();

  while (true) {
    await Future.delayed(
      Duration(milliseconds: 999 - DateTime.now().millisecond),
    );

    yield DateTime.now();
  }
}
