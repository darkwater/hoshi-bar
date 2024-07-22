import 'dart:math';

import 'package:fdls/widgets/render_rect_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputRegion extends StatefulWidget {
  final Widget child;

  const InputRegion({
    required this.child,
    super.key,
  });

  @override
  State<InputRegion> createState() => _InputRegionState();
}

class _InputRegionState extends State<InputRegion> {
  late final int id;

  @override
  void initState() {
    id = (DateTime.now().millisecondsSinceEpoch & 0x7fff << 16) |
        Random().nextInt(0xffff);
    print(id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RenderRectListener(
      listener: (rect) {
        const MethodChannel("fdls").invokeMethod("add_input_region", {
          "id": id,
          "x": rect.left.toInt(),
          "y": rect.top.toInt(),
          "width": rect.size.width.toInt(),
          "height": rect.size.height.toInt(),
        });
      },
      child: widget.child,
    );
  }

  @override
  void deactivate() {
    const MethodChannel("fdls").invokeMethod("remove_input_region", {
      "id": id,
    });

    super.deactivate();
  }
}
