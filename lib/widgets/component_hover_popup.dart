import 'package:hoshi_bar/constants.dart';
import 'package:hoshi_bar/providers/popup.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComponentHoverPopup extends ConsumerStatefulWidget {
  final IconData icon;
  final String title;
  final double? width;
  final double? height;
  final Widget? background;
  final List<Widget> underTitle;
  final Widget? body;

  const ComponentHoverPopup({
    required this.icon,
    required this.title,
    this.width = 300,
    this.height = 200,
    this.background,
    this.underTitle = const [],
    this.body,
    super.key,
  });

  @override
  ConsumerState<ComponentHoverPopup> createState() =>
      _ComponentHoverPopupState();
}

class _ComponentHoverPopupState extends ConsumerState<ComponentHoverPopup>
    with TickerProviderStateMixin {
  late final AnimationController fadeCtrl;
  late final Animation<double> fade;
  late final AnimationController slideCtrl;
  late final Animation<Offset> offset;

  late final ScrollController scrollController;
  bool scrolled = false;

  @override
  void initState() {
    super.initState();

    fadeCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 0,
    );

    fade = Tween<double>(begin: 0, end: 1).animate(fadeCtrl);
    fadeCtrl.forward();

    slideCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 0,
    );

    offset =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(parent: slideCtrl, curve: Curves.easeInOutCubic),
    );
    slideCtrl.forward();

    scrollController = ScrollController();
    scrollController.addListener(() {
      print('scrollController.addListener');
      if (scrollController.positions.isNotEmpty &&
          scrollController.offset > 0 &&
          !scrolled) {
        setState(() => scrolled = true);
      } else if (scrollController.positions.isNotEmpty &&
          scrollController.offset == 0 &&
          scrolled) {
        setState(() => scrolled = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final expanded = ref.watch(popupExpandedProvider);

    return SlideTransition(
      position: offset,
      transformHitTests: false,
      child: FadeTransition(
        opacity: fade,
        child: Material(
          color: hbBackgroundColor,
          shadowColor: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.2, color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              if (widget.background != null) widget.background!,
              if (expanded)
                Positioned.fill(
                  child: Column(
                    children: [
                      Material(
                        animationDuration: const Duration(milliseconds: 0),
                        color: scrolled
                            ? hbBackgroundColor.withOpacity(1)
                            : Colors.transparent,
                        elevation: scrolled ? 2 : 0,
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                widget.icon,
                                size: 24,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 4),
                                  ...widget.underTitle,
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.body != null)
                        Expanded(
                          child: PrimaryScrollController(
                            controller: scrollController,
                            child: widget.body!,
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    fadeCtrl.dispose();
    slideCtrl.dispose();
    scrollController.dispose();

    super.dispose();
  }
}
