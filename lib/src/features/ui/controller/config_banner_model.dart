import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:obs_animated_banners/src/core/theme/colors.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_viewmodel.dart';

enum DesignType { container, containerDivide, letter, letterDivide, image }
enum AnimationType {
  slideXLR,
  slideXRL,
  slideYBT,
  slideYTB,
  visibility,
  increase
}
enum AnimationCurve {
  bounceIn,
  bounceOut,
  decelerate,
  ease,
  easeIn,
  easeInOutBack,
  elasticIn,
  elasticOut,
  fastOutSlowIn,
  slowMiddle,
  linear
}
enum FontFamily { akshar, lato, montserrat, nunito, opensans, poppins, roboto }
enum SliderType {
  sw,
  sh,
  px,
  py,
  border,
  borderSize,
  elevation,
  offsetX,
  offsetY
}

extension FontFamilyX on FontFamily {
  String toShortString() {
    String family = toString().split('.').last;

    final result = family.replaceFirst(family[0], family[0].toUpperCase());

    return result;
  }
}

class ConfigBannerModel extends Equatable {
  final double pcWidth;
  final double pcHeight;
  final double pcPosX;
  final double pcPosY;
  final double radiusSize;
  final double elevation;
  final double fontSize;
  final double borderSize;
  final Offset elevationOffset;
  final Color primary;
  final Color secondary;
  final Color background;
  final Color titleColor;
  final Color subtitleColor;
  final Color shadowColor;
  final bool isImageBase;
  final DesignType designType;
  final AnimationType animationType;
  final AnimationCurve animationCurve;
  final double animationDuration;
  final double pauseTime;
  final Image? bannerImage;
  final Image? intrinsicImage;
  final FontFamily fontFamily;
  final bool isConfig;
  final String title;
  final String subtitle;
  const ConfigBannerModel({
    this.pcWidth = 0.2,
    this.pcHeight = 0.1,
    this.pcPosX = 0.1,
    this.pcPosY = 0.1,
    this.radiusSize = 10.0,
    this.elevation = 5.0,
    this.elevationOffset = const Offset(0, 5),
    this.primary = UiColors.primaryColor,
    this.secondary = UiColors.secondaryColor,
    this.background = Colors.white,
    this.titleColor = Colors.black,
    this.subtitleColor = Colors.white,
    this.shadowColor = Colors.black,
    this.isImageBase = false,
    this.designType = DesignType.container,
    this.animationType = AnimationType.slideXLR,
    this.animationCurve = AnimationCurve.ease,
    this.animationDuration = 5000,
    this.pauseTime = 2000,
    this.bannerImage,
    this.intrinsicImage,
    this.fontFamily = FontFamily.montserrat,
    this.isConfig = true,
    this.fontSize = 10,
    this.borderSize = 4.0,
    this.title = '',
    this.subtitle = '',
  });

  ConfigBannerModel copyWith({
    double? pcWidth,
    double? pcHeight,
    double? pcPosX,
    double? pcPosY,
    double? radiusSize,
    double? elevation,
    double? fontSize,
    double? borderSize,
    Offset? elevationOffset,
    Color? primary,
    Color? secondary,
    Color? background,
    Color? titleColor,
    Color? subtitleColor,
    Color? shadowColor,
    bool? isImageBase,
    DesignType? designType,
    AnimationType? animationType,
    AnimationCurve? animationCurve,
    double? animationDuration,
    double? pauseTime,
    Image? bannerImage,
    Image? intrinsicImage,
    FontFamily? fontFamily,
    bool? isConfig,
    String? title,
    String? subtitle,
  }) {
    return ConfigBannerModel(
      pcWidth: pcWidth ?? this.pcWidth,
      pcHeight: pcHeight ?? this.pcHeight,
      pcPosX: pcPosX ?? this.pcPosX,
      pcPosY: pcPosY ?? this.pcPosY,
      radiusSize: radiusSize ?? this.radiusSize,
      elevation: elevation ?? this.elevation,
      fontSize: fontSize ?? this.fontSize,
      borderSize: borderSize ?? this.borderSize,
      elevationOffset: elevationOffset ?? this.elevationOffset,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      titleColor: titleColor ?? this.titleColor,
      subtitleColor: subtitleColor ?? this.subtitleColor,
      shadowColor: shadowColor ?? this.shadowColor,
      isImageBase: isImageBase ?? this.isImageBase,
      designType: designType ?? this.designType,
      animationType: animationType ?? this.animationType,
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      pauseTime: pauseTime ?? this.pauseTime,
      bannerImage: bannerImage ?? this.bannerImage,
      intrinsicImage: intrinsicImage ?? this.intrinsicImage,
      fontFamily: fontFamily ?? this.fontFamily,
      isConfig: isConfig ?? this.isConfig,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  ConfigBannerModel nullImages(ImageTypeLocal imageTypeLocal) {
    if (imageTypeLocal == ImageTypeLocal.bannerImage) {
      return ConfigBannerModel(
        pcWidth: pcWidth,
        pcHeight: pcHeight,
        pcPosX: pcPosX,
        pcPosY: pcPosY,
        radiusSize: radiusSize,
        elevation: elevation,
        fontSize: fontSize,
        elevationOffset: elevationOffset,
        primary: primary,
        secondary: secondary,
        background: background,
        titleColor: titleColor,
        subtitleColor: subtitleColor,
        shadowColor: shadowColor,
        isImageBase: isImageBase,
        designType: designType,
        animationType: animationType,
        animationCurve: animationCurve,
        animationDuration: animationDuration,
        pauseTime: pauseTime,
        bannerImage: null,
        intrinsicImage: intrinsicImage,
        fontFamily: fontFamily,
        isConfig: isConfig,
        borderSize: borderSize,
        title: title,
        subtitle: subtitle,
      );
    } else if (imageTypeLocal == ImageTypeLocal.intrinsicImage) {
      return ConfigBannerModel(
        pcWidth: pcWidth,
        pcHeight: pcHeight,
        pcPosX: pcPosX,
        pcPosY: pcPosY,
        radiusSize: radiusSize,
        elevation: elevation,
        fontSize: fontSize,
        elevationOffset: elevationOffset,
        primary: primary,
        secondary: secondary,
        background: background,
        titleColor: titleColor,
        subtitleColor: subtitleColor,
        shadowColor: shadowColor,
        isImageBase: isImageBase,
        designType: designType,
        animationType: animationType,
        animationCurve: animationCurve,
        animationDuration: animationDuration,
        pauseTime: pauseTime,
        bannerImage: bannerImage,
        intrinsicImage: null,
        fontFamily: fontFamily,
        isConfig: isConfig,
        borderSize: borderSize,
        title: title,
        subtitle: subtitle,
      );
    } else {
      return ConfigBannerModel(
        pcWidth: pcWidth,
        pcHeight: pcHeight,
        pcPosX: pcPosX,
        pcPosY: pcPosY,
        radiusSize: radiusSize,
        elevation: elevation,
        fontSize: fontSize,
        elevationOffset: elevationOffset,
        primary: primary,
        secondary: secondary,
        background: background,
        titleColor: titleColor,
        subtitleColor: subtitleColor,
        shadowColor: shadowColor,
        isImageBase: isImageBase,
        designType: designType,
        animationType: animationType,
        animationCurve: animationCurve,
        animationDuration: animationDuration,
        pauseTime: pauseTime,
        bannerImage: null,
        intrinsicImage: intrinsicImage,
        fontFamily: fontFamily,
        isConfig: isConfig,
        borderSize: borderSize,
        title: title,
        subtitle: subtitle,
      );
    }
  }

  @override
  String toString() {
    return 'ConfigBannerModel(pcWidth: $pcWidth, pcHeight: $pcHeight, pcPosX: $pcPosX, pcPosY: $pcPosY, radiusSize: $radiusSize, elevation: $elevation, fontSize: $fontSize, borderSize: $borderSize, elevationOffset: $elevationOffset, primary: $primary, secondary: $secondary, background: $background, titleColor: $titleColor, subtitleColor: $subtitleColor, shadowColor: $shadowColor, isImageBase: $isImageBase, designType: $designType, animationType: $animationType, animationCurve: $animationCurve, animationDuration: $animationDuration, pauseTime: $pauseTime, bannerImage: $bannerImage, intrinsicImage: $intrinsicImage, fontFamily: $fontFamily, isConfig: $isConfig, title: $title, subtitle: $subtitle)';
  }

  @override
  List<Object?> get props {
    return [
      pcWidth,
      pcHeight,
      pcPosX,
      pcPosY,
      radiusSize,
      elevation,
      fontSize,
      borderSize,
      elevationOffset,
      primary,
      secondary,
      background,
      titleColor,
      subtitleColor,
      shadowColor,
      isImageBase,
      designType,
      animationType,
      animationCurve,
      animationDuration,
      pauseTime,
      bannerImage,
      intrinsicImage,
      fontFamily,
      isConfig,
      title,
      subtitle,
    ];
  }
}
