import 'package:flutter/material.dart';

class MinimalButtons extends StatelessWidget {
  const MinimalButtons({
    Key? key,
    this.onTap,
    required this.child,
    this.height,
    this.width,
    this.selected = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  final double? height;
  final double? width;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: IconButton(onPressed: onTap, icon: child),
    );
  }
}
