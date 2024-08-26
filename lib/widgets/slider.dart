import 'package:fdls/widgets/two_row.dart';
import 'package:flutter/material.dart';

class BarSlider extends StatefulWidget {
  final (Icon, Widget) Function(BuildContext, double) builder;
  final double value;
  final Function(double) onChanged;

  const BarSlider({
    required this.builder,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  State<BarSlider> createState() => _BarSliderState();
}

class _BarSliderState extends State<BarSlider> {
  double? _value;
  double? _lastSent;

  @override
  Widget build(BuildContext context) {
    final top = widget.builder(context, _value ?? widget.value);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onHorizontalDragStart: (details) {
        setState(() {
          _value = widget.value;
          _lastSent = _value;
        });
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          _value = (_value! + details.primaryDelta! / 200).clamp(0.0, 1.0);
        });

        if (_value != _lastSent) {
          _lastSent = _value;
          widget.onChanged(_value!);
        }
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          _value = null;
        });
      },
      child: TwoRow(
        icon: top.$1,
        top: top.$2,
        bottom: LinearProgressIndicator(
          value: _value ?? widget.value,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
