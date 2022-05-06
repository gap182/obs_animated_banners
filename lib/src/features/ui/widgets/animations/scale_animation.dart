import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/utils/functions.dart';

class ScaleAnimation extends AnimatedWidget {
  const ScaleAnimation({Key? key, required Listenable listenable})
      : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final size = MediaQuery.of(context).size;
    return Consumer(
      builder: (context, ref, child) {
        final designType =
            ref.watch(configBannerPod.select((value) => value.designType));

        final pcPosX =
            ref.watch(configBannerPod.select((value) => value.pcPosX));
        final pcPosY =
            ref.watch(configBannerPod.select((value) => value.pcPosY));
        return Positioned(
          left: pcPosX * size.width,
          bottom: pcPosY * size.height,
          child: Transform.scale(
            scale: animation.value,
            child: getBanner(designType, size),
          ),
        );
      },
    );
  }
}
