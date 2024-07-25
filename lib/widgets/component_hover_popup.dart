import 'package:fdls/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComponentHoverPopup extends HookConsumerWidget {
  final IconData icon;
  final String title;
  final double? width;
  final double? height;
  final Widget? background;
  final List<Widget> underTitle;

  const ComponentHoverPopup({
    required this.icon,
    required this.title,
    this.width = 300,
    this.height = 200,
    this.background,
    this.underTitle = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fadeCtrl = useAnimationController(
      vsync: useSingleTickerProvider(),
      duration: const Duration(milliseconds: 200),
      initialValue: 0,
    );

    final fade = Tween<double>(begin: 0, end: 1).animate(fadeCtrl);
    fadeCtrl.forward();

    final slideCtrl = useAnimationController(
      vsync: useSingleTickerProvider(),
      duration: const Duration(milliseconds: 200),
      initialValue: 0,
    );

    final offset = Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: slideCtrl, curve: Easing.standardDecelerate));

    slideCtrl.forward();

    return SlideTransition(
      position: offset,
      child: FadeTransition(
        opacity: fade,
        child: IgnorePointer(
          child: Material(
            color: fdlsBackgroundColor,
            shadowColor: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.2, color: Colors.grey.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 400,
              height: 300,
              child: Stack(
                children: [
                  if (background != null) background!,
                  Positioned(
                    left: 14,
                    top: 14,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          icon,
                          size: 24,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            ...underTitle,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
