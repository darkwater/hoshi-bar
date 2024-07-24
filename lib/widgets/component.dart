import 'package:fdls/constants.dart';
import 'package:fdls/widgets/input_region.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Component<T> extends StatelessWidget {
  final Color primaryColor;
  final double? width;
  final BorderSide border;
  final Function()? onTap;
  final Widget Function(BuildContext)? onHoverBuilder;
  final Widget child;

  const Component({
    required this.primaryColor,
    this.width,
    this.border = BorderSide.none,
    this.onTap,
    this.onHoverBuilder,
    required this.child,
    super.key,
  });

  Component.asyncValue({
    required AsyncValue<T> value,
    required Widget Function(BuildContext, T) builder,
    required this.primaryColor,
    this.width,
    this.border = BorderSide.none,
    this.onTap,
    this.onHoverBuilder,
    super.key,
  }) : child = Builder(
          builder: (context) => value.when(
            data: (v) => builder(context, v),
            error: (e, st) => ComponentErrorContents(e, st),
            loading: () => Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: width != null ? null : 40,
                child: const Center(child: LinearProgressIndicator()),
              ),
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
            child: Theme(
              data: Theme.of(context).copyWith(primaryColor: primaryColor),
              child: _Interactivity(
                onTap: onTap,
                onHoverBuilder: onHoverBuilder,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Interactivity extends StatefulWidget {
  final Function()? onTap;
  final Widget Function(BuildContext)? onHoverBuilder;
  final Widget child;

  const _Interactivity({
    required this.onTap,
    this.onHoverBuilder,
    required this.child,
  });

  @override
  State<_Interactivity> createState() => _InteractivityState();
}

class _InteractivityState extends State<_Interactivity> {
  OverlayEntry? _hoverOverlay;
  OverlayEntry? _tapOverlay;
  // Rect? _alignRect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: widget.onHoverBuilder != null
          ? (enter) {
              if (enter) {
                // final box = context.findRenderObject() as RenderBox;
                // _alignRect = box.localToGlobal(Offset.zero) & box.size;

                final theme = Theme.of(context);
                _hoverOverlay = OverlayEntry(builder: (context) {
                  return Positioned(
                    bottom: fdlsBarHeight,
                    right: 20,
                    child: Theme(
                      data: theme,
                      child: widget.onHoverBuilder!(context),
                    ),
                  );
                });

                Overlay.of(context, debugRequiredFor: widget)
                    .insert(_hoverOverlay!);
              } else {
                _hoverOverlay?.remove();
                _hoverOverlay?.dispose();
                _hoverOverlay = null;
              }
            }
          : null,
      child: widget.child,
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
