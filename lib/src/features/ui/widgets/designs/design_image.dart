import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';

class DesignImage extends ConsumerWidget {
  const DesignImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * values.pcWidth,
      height: size.height * values.pcHeight,
      child: values.intrinsicImage,
    );
  }
}
