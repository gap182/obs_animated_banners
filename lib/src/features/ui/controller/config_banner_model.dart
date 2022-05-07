import 'dart:convert';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:obs_animated_banners/src/core/theme/colors.dart';
import 'package:obs_animated_banners/src/core/utils/common_extensions.dart';
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
  final Uint8List? bannerImage;
  final Uint8List? intrinsicImage;
  final FontFamily fontFamily;
  final bool isConfig;
  final bool locked;
  const ConfigBannerModel({
    this.pcWidth = 0.2,
    this.pcHeight = 0.1,
    this.pcPosX = 0.1,
    this.pcPosY = 0.1,
    this.radiusSize = 10.0,
    this.elevation = 5.0,
    this.fontSize = 10,
    this.borderSize = 4.0,
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
    this.locked = false,
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
    Uint8List? bannerImage,
    Uint8List? intrinsicImage,
    FontFamily? fontFamily,
    bool? isConfig,
    String? title,
    String? subtitle,
    bool? locked,
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
      locked: locked ?? this.locked,
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
      );
    }
  }

  @override
  String toString() {
    return 'ConfigBannerModel(pcWidth: $pcWidth, pcHeight: $pcHeight, pcPosX: $pcPosX, pcPosY: $pcPosY, radiusSize: $radiusSize, elevation: $elevation, fontSize: $fontSize, borderSize: $borderSize, elevationOffset: $elevationOffset, primary: $primary, secondary: $secondary, background: $background, titleColor: $titleColor, subtitleColor: $subtitleColor, shadowColor: $shadowColor, isImageBase: $isImageBase, designType: $designType, animationType: $animationType, animationCurve: $animationCurve, animationDuration: $animationDuration, pauseTime: $pauseTime, bannerImage: $bannerImage, intrinsicImage: $intrinsicImage, fontFamily: $fontFamily, isConfig: $isConfig, locked: $locked)';
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
      locked,
    ];
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    final offset = {"dx": elevationOffset.dx, "dy": elevationOffset.dy};

    result.addAll({'pcWidth': pcWidth});
    result.addAll({'pcHeight': pcHeight});
    result.addAll({'pcPosX': pcPosX});
    result.addAll({'pcPosY': pcPosY});
    result.addAll({'radiusSize': radiusSize});
    result.addAll({'elevation': elevation});
    result.addAll({'fontSize': fontSize});
    result.addAll({'borderSize': borderSize});
    result.addAll({'elevationOffset': offset});
    result.addAll({'primary': primary.value});
    result.addAll({'secondary': secondary.value});
    result.addAll({'background': background.value});
    result.addAll({'titleColor': titleColor.value});
    result.addAll({'subtitleColor': subtitleColor.value});
    result.addAll({'shadowColor': shadowColor.value});
    result.addAll({'isImageBase': isImageBase});
    result.addAll({'designType': designType.toShortString()});
    result.addAll({'animationType': animationType.toShortString()});
    result.addAll({'animationCurve': animationCurve.toShortString()});
    result.addAll({'animationDuration': animationDuration});
    result.addAll({'pauseTime': pauseTime});
    if (bannerImage != null) {
      result.addAll({'bannerImage': bannerImage!.toBase64()});
    }
    if (intrinsicImage != null) {
      result.addAll({'intrinsicImage': intrinsicImage!.toBase64()});
    }
    result.addAll({'fontFamily': fontFamily.toShortString()});
    result.addAll({'isConfig': isConfig});
    result.addAll({'locked': locked});

    return result;
  }

  factory ConfigBannerModel.fromMap(Map<String, dynamic> map) {
    return ConfigBannerModel(
      pcWidth: map['pcWidth']?.toDouble() ?? 0.0,
      pcHeight: map['pcHeight']?.toDouble() ?? 0.0,
      pcPosX: map['pcPosX']?.toDouble() ?? 0.0,
      pcPosY: map['pcPosY']?.toDouble() ?? 0.0,
      radiusSize: map['radiusSize']?.toDouble() ?? 0.0,
      elevation: map['elevation']?.toDouble() ?? 0.0,
      fontSize: map['fontSize']?.toDouble() ?? 0.0,
      borderSize: map['borderSize']?.toDouble() ?? 0.0,
      elevationOffset:
          Offset(map["elevationOffset"]["dx"], map["elevationOffset"]["dy"]),
      primary: Color(map['primary']),
      secondary: Color(map['secondary']),
      background: Color(map['background']),
      titleColor: Color(map['titleColor']),
      subtitleColor: Color(map['subtitleColor']),
      shadowColor: Color(map['shadowColor']),
      isImageBase: map['isImageBase'] ?? false,
      designType: (map['designType'] as String).toDesignType(),
      animationType: (map['animationType'] as String).toAnimationType(),
      animationCurve: (map['animationCurve'] as String).toAnimationCurve(),
      animationDuration: map['animationDuration']?.toDouble() ?? 0.0,
      pauseTime: map['pauseTime']?.toDouble() ?? 0.0,
      bannerImage: map['bannerImage'] != null
          ? (map['bannerImage'] as String).toUint8List()
          : null,
      intrinsicImage: map['intrinsicImage'] != null
          ? (map['intrinsicImage'] as String).toUint8List()
          : null,
      fontFamily: (map['fontFamily'] as String).toFontFamily(),
      isConfig: map['isConfig'] ?? false,
      locked: map['locked'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigBannerModel.fromJson(String source) =>
      ConfigBannerModel.fromMap(json.decode(source));
}
