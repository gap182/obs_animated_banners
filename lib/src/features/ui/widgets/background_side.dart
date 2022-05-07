import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/utils/functions.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/animations/scale_animation.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/animations/slide_lr_animation.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/animations/visibility_animation.dart';

class BackgroundSide extends ConsumerStatefulWidget {
  const BackgroundSide({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BackgroundSideState();
}

class _BackgroundSideState extends ConsumerState<BackgroundSide>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  StreamController<AnimationController> animationStream = StreamController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    animationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final valuesConfig = ref.watch(configBannerPod);
    final animationType = valuesConfig.animationType;
    final size = MediaQuery.of(context).size;
    final tween = ref.watch(animationPod(size));
    final curve = getCurve(valuesConfig);

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: valuesConfig.animationDuration.ceil()),
    );

    ref.read(animationControllerPod.notifier).changeController(controller);

    final isSlide = (animationType == AnimationType.slideXLR ||
        animationType == AnimationType.slideXRL ||
        animationType == AnimationType.slideYBT ||
        animationType == AnimationType.slideYTB);

    animation = tween.animate(
      CurvedAnimation(parent: controller, curve: curve),
    );

    return Expanded(
      child: Stack(
        children: [
          Container(
            color: ref.watch(configBannerPod).background,
          ),
          valuesConfig.isConfig
              ? Positioned(
                  left: size.width * valuesConfig.pcPosX,
                  bottom: size.height * valuesConfig.pcPosY,
                  child: getBanner(valuesConfig.designType, size))
              : const SizedBox.shrink(),
          // isSlide
          //     ? SlideLR(animation: animation)
          //     : valuesConfig.animationType == AnimationType.visibility
          //         ? VisibilityAnimation(listenable: animation)
          //         : valuesConfig.animationType == AnimationType.increase
          //             ? ScaleAnimation(listenable: animation)
          //             : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
