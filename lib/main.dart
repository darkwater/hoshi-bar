import 'dart:async';

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
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ref.watch(themeColorProvider),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: ref.watch(themeColorProvider),
          brightness: Brightness.dark,
        ),
      ),
      home: SizedBox(
        height: 50,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Material(
              color: const Color.fromRGBO(0x21, 0x27, 0x33, 0.5),
              borderRadius: BorderRadius.circular(8),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 64, vertical: 8),
                child: Text('Test'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
