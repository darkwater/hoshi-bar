import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Component<T> extends StatelessWidget {
  final Widget child;
  final double? width;

  const Component({
    required this.child,
    this.width,
    super.key,
  });

  Component.asyncValue({
    required AsyncValue<T> value,
    required Widget Function(T) builder,
    this.width,
    super.key,
  }) : child = value.when(
          data: (v) => builder(v),
          error: (e, st) => Tooltip(
            message: e.toString(),
            verticalOffset: -16,
            child: const Icon(
              Icons.warning_amber,
              color: Colors.red,
            ),
          ),
          loading: () => SizedBox(
            width: width != null ? null : 40,
            child: const Center(child: LinearProgressIndicator()),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Material(
          color: const Color.fromRGBO(0x21, 0x27, 0x33, 0.6),
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAlias,
          child: child,
        ),
      ),
    );
  }
}
