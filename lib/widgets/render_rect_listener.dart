import 'package:flutter/material.dart';

class RenderRectListener extends StatefulWidget {
  final Widget child;
  final Function(Rect) listener;

  const RenderRectListener({
    required this.listener,
    required this.child,
    super.key,
  });

  @override
  State<RenderRectListener> createState() => _RenderRectListenerState();
}

class _RenderRectListenerState extends State<RenderRectListener> {
  Rect? lastRect;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final box = context.findRenderObject();
      if (box is RenderBox) {
        final rect = box.localToGlobal(Offset.zero) & box.size;
        if (lastRect == rect) return;

        widget.listener(rect);
        lastRect = rect;
      }
    });

    return widget.child;
  }
}
