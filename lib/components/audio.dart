import 'package:fdls/constants.dart';
import 'package:fdls/src/rust/api/simple.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio.g.dart';
// part 'audio.freezed.dart';

@riverpod
Stream<List<void>> audioStream(AudioStreamRef ref) async* {}

class AudioComponent extends ConsumerWidget {
  const AudioComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audios = ref.watch(audioStreamProvider);

    return Component(
      primaryColor: Colors.green,
      width: fdlsSmallComponentWidth,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {},
        child: TwoRow(
          top: Text(greet(name: "PipeWire")),
          icon: const Icon(Icons.volume_up),
          bottom: LinearProgressIndicator(
            value: 0.5,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
