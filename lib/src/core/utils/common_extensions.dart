import 'dart:convert';
import 'dart:typed_data';

import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

extension DesignTypeX on DesignType {
  String toShortString() {
    String design = toString().split('.').last;

    // final result = design.replaceFirst(design[0], design[0].toUpperCase());

    return design;
  }
}

extension AnimationTypeX on AnimationType {
  String toShortString() {
    String animationType = toString().split('.').last;

    // final result = animationType.replaceFirst(
    //     animationType[0], animationType[0].toUpperCase());

    return animationType;
  }
}

extension AnimationCurveX on AnimationCurve {
  String toShortString() {
    String animationCurve = toString().split('.').last;

    // final result = animationCurve.replaceFirst(
    //     animationCurve[0], animationCurve[0].toUpperCase());

    return animationCurve;
  }
}

extension FontFamilyX on FontFamily {
  String toShortString() {
    String family = toString().split('.').last;

    // final result = family.replaceFirst(family[0], family[0].toUpperCase());

    return family;
  }
}

extension Uint8ListX on Uint8List {
  String toBase64() {
    return base64Encode(this);
  }
}

extension StringX on String {
  DesignType toDesignType() {
    final design = DesignType.values
        .firstWhere((element) => element.toShortString() == this);
    return design;
  }

  AnimationType toAnimationType() {
    final animationType = AnimationType.values
        .firstWhere((element) => element.toShortString() == this);
    return animationType;
  }

  AnimationCurve toAnimationCurve() {
    final animationCurve = AnimationCurve.values
        .firstWhere((element) => element.toShortString() == this);
    return animationCurve;
  }

  FontFamily toFontFamily() {
    final fontFamily = FontFamily.values
        .firstWhere((element) => element.toShortString() == this);
    return fontFamily;
  }

  Uint8List toUint8List() {
    final list = base64Decode(this);
    return list;
  }
}
