import 'package:flutter/material.dart';

class TwoRow extends StatelessWidget {
  final Widget? icon;
  final Widget top;
  final Widget bottom;

  const TwoRow({
    this.icon,
    required this.top,
    required this.bottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconTheme.merge(
      data: IconThemeData(
        size: 16,
        color: Theme.of(context).primaryColor,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (icon != null) icon!,
                    Flexible(
                      fit: constraints.maxWidth == double.infinity
                          ? FlexFit.loose
                          : FlexFit.tight,
                      child: DefaultTextStyle.merge(
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        softWrap: false,
                        textAlign: TextAlign.right,
                        child: top,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12,
                      height: -0.2,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                    child: bottom,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
