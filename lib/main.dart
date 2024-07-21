import 'dart:async';

import 'package:fdls/components/battery.dart';
import 'package:fdls/components/clock.dart';
import 'package:fdls/components/loadavg.dart';
import 'package:fdls/components/network.dart';
import 'package:fdls/components/temperature.dart';
import 'package:fdls/providers/theme.dart';
import 'package:flutter/material.dart';
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
      home: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClockComponent(),
            ClockComponent(),
            ClockComponent(),
            ClockComponent(),
            ClockComponent(),
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
    );
  }
}
