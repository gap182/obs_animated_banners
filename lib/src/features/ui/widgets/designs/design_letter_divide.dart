import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

class DesignLetterDivide extends ConsumerWidget {
  const DesignLetterDivide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              values.title,
              style: TextStyle(
                color: values.titleColor,
                fontFamily: values.fontFamily.toShortString(),
                fontSize: values.fontSize * 1.3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 5,
              decoration: BoxDecoration(
                color: values.secondary,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              values.subtitle,
              style: TextStyle(
                color: values.subtitleColor,
                fontFamily: values.fontFamily.toShortString(),
                fontSize: values.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
