import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  final bool visible;
  final Alignment targetAnchor;
  final Alignment followerAnchor;
  final Widget Function(BuildContext) builder;
  final Widget child;

  const Popup({
    required this.visible,
    required this.targetAnchor,
    required this.followerAnchor,
    required this.builder,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
