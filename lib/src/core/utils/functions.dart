import 'package:flutter/material.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_container.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_container_divide.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_image.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_letter.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_letter_divide.dart';

Widget getBanner(DesignType designType, Size size) {
  switch (designType) {
    case DesignType.image:
      return const DesignImage();

    case DesignType.container:
      return const DesignContainer();
    case DesignType.containerDivide:
      return const DesignContainerDivide();
    case DesignType.letter:
      return const DesignLetter();
    case DesignType.letterDivide:
      return const DesignLetterDivide();
    default:
      return const DesignContainer();
  }
}

Curve getCurve(ConfigBannerModel values) {
  switch (values.animationCurve) {
    case AnimationCurve.bounceIn:
      return Curves.bounceIn;
    case AnimationCurve.bounceOut:
      return Curves.bounceOut;
    case AnimationCurve.decelerate:
      return Curves.decelerate;
    case AnimationCurve.ease:
      return Curves.ease;
    case AnimationCurve.easeIn:
      return Curves.easeIn;
    case AnimationCurve.easeInOutBack:
      return Curves.easeInOutBack;
    case AnimationCurve.elasticIn:
      return Curves.elasticIn;
    case AnimationCurve.elasticOut:
      return Curves.elasticOut;
    case AnimationCurve.fastOutSlowIn:
      return Curves.fastOutSlowIn;
    case AnimationCurve.linear:
      return Curves.linear;
    case AnimationCurve.slowMiddle:
      return Curves.slowMiddle;

    default:
      return Curves.linear;
  }
}
