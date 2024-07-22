import 'package:fdls/constants.dart';
import 'package:fdls/widgets/input_region.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Component<T> extends StatelessWidget {
  final Widget child;
  final double? width;
  final BorderSide border;
  final Function()? onTap;

  const Component({
    required this.child,
    this.width,
    this.border = BorderSide.none,
    this.onTap,
    super.key,
  });

  Component.asyncValue({
    required AsyncValue<T> value,
    required Widget Function(T) builder,
    this.width,
    this.border = BorderSide.none,
    this.onTap,
    super.key,
  }) : child = value.when(
          data: (v) => builder(v),
          error: (e, st) => ComponentErrorContents(e, st),
          loading: () => Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: width != null ? null : 40,
              child: const Center(child: LinearProgressIndicator()),
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: InputRegion(
          child: Material(
            color: fdlsBackgroundColor,
            shadowColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: border,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: onTap,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class ComponentErrorContents extends StatelessWidget {
  final Object error;
  final StackTrace? stackTrace;

  const ComponentErrorContents(
    this.error,
    this.stackTrace, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: error.toString(),
      verticalOffset: -16,
      child: Container(
        color: Colors.red.withOpacity(0.2),
        child: const Icon(
          Icons.warning_amber,
          color: Colors.red,
        ),
      ),
    );
  }
}
