import 'package:flutter/material.dart';

import '../../features/ui/controller/config_banner_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String getDesignName(DesignType designType, BuildContext context) {
  switch (designType) {
    case DesignType.one:
      return AppLocalizations.of(context)!.designOneName;

    case DesignType.two:
      return AppLocalizations.of(context)!.designTwoName;
    case DesignType.three:
      return AppLocalizations.of(context)!.designThreeName;
    case DesignType.four:
      return AppLocalizations.of(context)!.designFourName;
    case DesignType.five:
      return AppLocalizations.of(context)!.designFiveName;
    default:
      return AppLocalizations.of(context)!.designTwoName;
  }
}

String getAnimationName(AnimationType animationType, BuildContext context) {
  switch (animationType) {
    case AnimationType.slide:
      return AppLocalizations.of(context)!.animationSlideName;
    case AnimationType.visibility:
      return AppLocalizations.of(context)!.animationVisibilityName;
    case AnimationType.increase:
      return AppLocalizations.of(context)!.animationIncreaseName;

    default:
      return AppLocalizations.of(context)!.animationSlideName;
  }
}

String getAnimationCurveName(
    AnimationCurve animationCurve, BuildContext context) {
  switch (animationCurve) {
    case AnimationCurve.bounceIn:
      return AppLocalizations.of(context)!.bounceIn;
    case AnimationCurve.bounceOut:
      return AppLocalizations.of(context)!.bounceOut;
    case AnimationCurve.decelerate:
      return AppLocalizations.of(context)!.decelerate;
    case AnimationCurve.ease:
      return AppLocalizations.of(context)!.ease;
    case AnimationCurve.easeIn:
      return AppLocalizations.of(context)!.easeIn;
    case AnimationCurve.easeInOutBack:
      return AppLocalizations.of(context)!.easeInOutBack;
    case AnimationCurve.elasticIn:
      return AppLocalizations.of(context)!.elasticIn;
    case AnimationCurve.elasticOut:
      return AppLocalizations.of(context)!.elasticOut;
    case AnimationCurve.fastOutSlowIn:
      return AppLocalizations.of(context)!.fastOutSlowIn;
    case AnimationCurve.slowMiddle:
      return AppLocalizations.of(context)!.slowMiddle;
    case AnimationCurve.linear:
      return AppLocalizations.of(context)!.linear;
  }
}

String getFontFamilyName(FontFamily fontFamily, BuildContext context) {
  switch (fontFamily) {
    case FontFamily.akshar:
      return "Akshar";
    case FontFamily.lato:
      return "Lato";
    case FontFamily.montserrat:
      return "Montserrat";
    case FontFamily.nunito:
      return "Nunito";
    case FontFamily.opensans:
      return "Opensans";
    case FontFamily.poppins:
      return "Poppins";
    case FontFamily.roboto:
      return "Roboto";
  }
}

List<DesignType> getDesigns() {
  final list = <DesignType>[];
  for (DesignType item in DesignType.values) {
    list.add(item);
  }
  return list;
}

List<AnimationType> getAnimations() {
  final list = <AnimationType>[];
  for (AnimationType animation in AnimationType.values) {
    list.add(animation);
  }
  return list;
}

List<AnimationCurve> getAnimationsCurves() {
  final list = <AnimationCurve>[];
  for (AnimationCurve animation in AnimationCurve.values) {
    list.add(animation);
  }
  return list;
}

List<FontFamily> getFontFamilies() {
  final list = <FontFamily>[];
  for (FontFamily font in FontFamily.values) {
    list.add(font);
  }
  return list;
}
