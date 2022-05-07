import 'package:flutter/material.dart';
import 'package:obs_animated_banners/src/core/theme/colors.dart';

class TextContainer extends StatelessWidget {
  const TextContainer({
    Key? key,
    this.child,
    this.isSelected = false,
  }) : super(key: key);

  final Widget? child;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isSelected ? UiColors.primaryColor : Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }
}
