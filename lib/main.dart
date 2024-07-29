import 'dart:async';

import 'package:fdls/components/battery.dart';
import 'package:fdls/components/clock.dart';
import 'package:fdls/components/loadavg.dart';
import 'package:fdls/components/network.dart';
import 'package:fdls/components/temperature.dart';
import 'package:fdls/components/workspaces.dart';
import 'package:fdls/constants.dart';
import 'package:fdls/providers/popup.dart';
import 'package:fdls/widgets/input_region.dart';
import 'package:fdls/widgets/render_rect_listener.dart';
import 'package:fdls/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const MethodChannel("fdls").invokeMethod("reset_input_regions");

  runApp(const ProviderScope(child: App()));
}

final barWidthProvider = StateProvider<double>((ref) => 0);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ref.watch(themeColorProvider),
          brightness: Brightness.dark,
        ),
      ),
      home: RenderRectListener(
        listener: (rect) {
          ref.read(screenSizeProvider.notifier).state = rect.size;
        },
        child: Stack(
          children: [
            if (ref.watch(popupExpandedProvider))
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    ref.read(popupProvider.notifier).state = null;
                    ref.read(popupExpandedProvider.notifier).state = false;
                  },
                  child: const InputRegion(
                    child: SizedBox(),
                  ),
                ),
              ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              height: fdlsBarHeight,
              child: RenderRectListener(
                listener: (box) {
                  ref.read(barWidthProvider.notifier).state = box.size.width;

                  print("setting exclusive zone height to ${box.size.height}");
                  const MethodChannel("fdls").invokeMethod("set_exclusive_zone",
                      {"height": box.size.height.toInt()});
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      WorkspacesComponent(),
                      Spacer(),
                      NetworkComponent(),
                      LoadAvgComponent(),
                      TemperatureComponent(),
                      BatteryComponent(),
                      ClockComponent(),
                    ],
                  ),
                ),
              ),
            ),
            const _Popup(),
          ],
        ),
      ),
    );
  }
}

class _Popup extends ConsumerWidget {
  const _Popup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popup = ref.watch(popupProvider);
    if (popup == null) return const SizedBox();

    final anchorRect = ref.watch(popupAnchorRectProvider);
    final size = ref.watch(popupSizeProvider);

    final screenSize = ref.watch(screenSizeProvider);
    const padding = EdgeInsets.only(
      left: 20,
      top: 20,
      right: 20,
    );
    final popupArea = padding.deflateRect(Offset.zero & screenSize);

    final bottomCenter = anchorRect.topCenter - const Offset(0, 10);
    final bottomLeft = bottomCenter - Offset(size.width / 2, 0);

    Rect rect = Rect.fromPoints(
      bottomLeft,
      bottomLeft + Offset(size.width, -size.height),
    );

    if (rect.right > popupArea.right) {
      final diff = rect.right - popupArea.right;
      rect = rect.translate(-diff, 0);
    }

    if (rect.left < popupArea.left) {
      final diff = popupArea.left - rect.left;
      rect = rect.translate(diff, 0);
    }

    final theme = ref.watch(popupThemeProvider);

    return Positioned.fromRect(
      rect: rect,
      child: Theme(
        data: theme,
        child: popup,
      ),
    );
  }
}
