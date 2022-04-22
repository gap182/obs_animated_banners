import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/theme/text_styles.dart';

class CustomSlider extends ConsumerWidget {
  const CustomSlider(
      {required this.title,
      required this.onChanged,
      required this.value,
      this.min = 0.0,
      this.max = 1.0,
      Key? key})
      : super(key: key);

  final double value;
  final Function(double) onChanged;
  final String title;
  final double min;
  final double max;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: h2.copyWith(color: Colors.black),
          ),
        ),
        Slider(
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
        ),
      ],
    );
  }
}
