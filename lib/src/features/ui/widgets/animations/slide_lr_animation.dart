import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/utils/functions.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

class SlideLR extends AnimatedWidget {
  const SlideLR({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final size = MediaQuery.of(context).size;
    double? left;

    double? bottom;
    return Consumer(
      builder: (context, ref, child) {
        final animationType =
            ref.watch(configBannerPod.select((value) => value.animationType));
        final pcPosX =
            ref.watch(configBannerPod.select((value) => value.pcPosX));
        final pcPosY =
            ref.watch(configBannerPod.select((value) => value.pcPosY));

        final designType =
            ref.watch(configBannerPod.select((value) => value.designType));

        if (animationType == AnimationType.slideXLR) {
          left = animation.value;
          bottom = size.height * pcPosY;
        } else if (animationType == AnimationType.slideXRL) {
          left = animation.value;
          bottom = size.height * pcPosY;
        } else if (animationType == AnimationType.slideYBT) {
          left = size.width * pcPosX;
          bottom = animation.value;
        } else if (animationType == AnimationType.slideYTB) {
          left = size.width * pcPosX;
          bottom = animation.value;
        }

        return Positioned(
          left: left,
          bottom: bottom,
          child: getBanner(designType, size),
        );
      },
    );
  }
}
