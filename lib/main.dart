import 'dart:async';

import 'package:fdls/components/battery.dart';
import 'package:fdls/components/clock.dart';
import 'package:fdls/components/loadavg.dart';
import 'package:fdls/components/network.dart';
import 'package:fdls/components/temperature.dart';
import 'package:fdls/components/workspaces.dart';
import 'package:fdls/widgets/render_rect_listener.dart';
import 'package:fdls/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

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
      home: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            height: 64,
            child: RenderRectListener(
              listener: (box) {
                print("setting exclusive zone height to ${box.size.height}");
                const MethodChannel("fdls").invokeMethod(
                    "set_exclusive_zone", {"height": box.size.height.toInt()});
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    WorkspacesComponent(),
                    Spacer(),
                    ClockComponent(),
                    ClockComponent(),
                    ClockComponent(),
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
        ],
      ),
    );
  }
}
