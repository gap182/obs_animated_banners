import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/theme/colors.dart';

class AnimationButton extends ConsumerWidget {
  const AnimationButton({
    Key? key,
    this.onTap,
    this.child,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
