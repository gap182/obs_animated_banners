import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/utils/common_extensions.dart';

class DesignLetterDivide extends ConsumerWidget {
  const DesignLetterDivide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    final fontFamily = values.fontFamily.toShortString().replaceFirst(
        values.fontFamily.toShortString()[0],
        values.fontFamily.toShortString()[0].toUpperCase());
    final title = ref.watch(textinfoPod.select((value) => value.title));
    final subtitle = ref.watch(textinfoPod.select((value) => value.subtitle));
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: TextStyle(
                color: values.titleColor,
                fontFamily: fontFamily,
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
              subtitle ?? '',
              style: TextStyle(
                color: values.subtitleColor,
                fontFamily: fontFamily,
                fontSize: values.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
