import 'package:flutter/material.dart';

class Component extends StatelessWidget {
  final Widget child;

  const Component({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        color: const Color.fromRGBO(0x21, 0x27, 0x33, 0.5),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: child,
        ),
      ),
    );
  }
}
