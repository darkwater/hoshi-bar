import 'package:fdls/constants.dart';
import 'package:fdls/sysfs/backlight.dart';
import 'package:fdls/widgets/component.dart';
import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'backlight.g.dart';
part 'backlight.freezed.dart';

@riverpod
Stream<List<Backlight>> backlightStream(BacklightStreamRef ref) async* {
  final backlights = await SysfsBacklight.list();

  while (true) {
    yield backlights
        .map((e) => Backlight(
              sysfs: e,
              brightness: e.brightness,
              brightnessFraction: e.brightnessFraction,
              maxBrightness: e.maxBrightness,
            ))
        .toList();

    await Future.delayed(fdlsUpdateFrequency);
  }
}

@freezed
abstract class Backlight with _$Backlight {
  const factory Backlight({
    required SysfsBacklight sysfs,
    required double brightnessFraction,
    required int brightness,
    required int maxBrightness,
  }) = _Backlight;
}

class BacklightComponent extends ConsumerWidget {
  const BacklightComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backlights = ref.watch(backlightStreamProvider);

    return Row(
      children: [
        ...(backlights.valueOrNull ?? []).map((backlight) {
          return Component(
            primaryColor: Colors.yellow,
            width: fdlsSmallComponentWidth,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onHorizontalDragUpdate: (details) {
                // TODO: use dbus instead
                // https://github.com/Alexays/Waybar/blob/master/src/util/backlight_backend.cpp#L266

                final delta = details.primaryDelta! / 100;
                final newBrightness =
                    (backlight.sysfs.brightnessFraction + delta).clamp(0, 1);

                print(delta);

                backlight.sysfs.brightness =
                    (newBrightness * backlight.maxBrightness).round();

                ref.invalidate(backlightStreamProvider);
              },
              child: TwoRow(
                top: Text("${(backlight.brightnessFraction * 100).round()}%"),
                icon: const Icon(Icons.light_mode),
                bottom: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: LinearProgressIndicator(
                    value: backlight.brightnessFraction,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
