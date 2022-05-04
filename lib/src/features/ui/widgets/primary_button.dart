import 'package:flutter/material.dart';
import 'package:obs_animated_banners/src/core/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    this.onPressed,
    this.text,
    this.height,
    this.widht,
    this.color,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? text;
  final double? widht;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text ?? '',
          style: h2.copyWith(
              color: color == Colors.white ? Colors.black : Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }
}
