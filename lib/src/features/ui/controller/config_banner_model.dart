import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:obs_animated_banners/src/core/theme/colors.dart';

enum DesignType { main, sec }
enum AnimationType { slide, visibility }
enum AnimationCurve { bounce, ease }
enum FontFamily { akshar, lato, montserrat, nunito, opensans, poppins, roboto }
enum SliderType { sw, sh, px, py, border, elevation, offsetX, offsetY }

class ConfigBannerModel extends Equatable {
  double pcWidth;
  double pcHeight;
  double pcPosX;
  double pcPosY;
  double radiusSize;
  double elevation;
  Offset elevationOffset;
  Color primary;
  Color secondary;
  Color background;
  DesignType designType;
  AnimationType animationType;
  AnimationCurve animationCurve;
  double animationDuration;
  XFile? bannerImage;
  XFile? intrinsicImage;
  FontFamily fontFamily;
  ConfigBannerModel({
    this.pcWidth = 0.0,
    this.pcHeight = 0.0,
    this.pcPosX = 0.0,
    this.pcPosY = 0.0,
    this.radiusSize = 0.0,
    this.elevation = 0.0,
    this.elevationOffset = const Offset(0, 5),
    this.primary = UiColors.primaryColor,
    this.secondary = UiColors.secondaryColor,
    this.background = Colors.black,
    this.designType = DesignType.main,
    this.animationType = AnimationType.slide,
    this.animationCurve = AnimationCurve.ease,
    this.animationDuration = 300,
    this.bannerImage,
    this.intrinsicImage,
    this.fontFamily = FontFamily.montserrat,
  });

  ConfigBannerModel copyWith({
    double? pcWidth,
    double? pcHeight,
    double? pcPosX,
    double? pcPosY,
    double? radiusSize,
    double? elevation,
    Offset? elevationOffset,
    Color? primary,
    Color? secondary,
    Color? background,
    DesignType? designType,
    AnimationType? animationType,
    AnimationCurve? animationCurve,
    double? animationDuration,
    XFile? bannerImage,
    XFile? intrinsicImage,
    FontFamily? fontFamily,
  }) {
    return ConfigBannerModel(
      pcWidth: pcWidth ?? this.pcWidth,
      pcHeight: pcHeight ?? this.pcHeight,
      pcPosX: pcPosX ?? this.pcPosX,
      pcPosY: pcPosY ?? this.pcPosY,
      radiusSize: radiusSize ?? this.radiusSize,
      elevation: elevation ?? this.elevation,
      elevationOffset: elevationOffset ?? this.elevationOffset,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      designType: designType ?? this.designType,
      animationType: animationType ?? this.animationType,
      animationCurve: animationCurve ?? this.animationCurve,
      animationDuration: animationDuration ?? this.animationDuration,
      bannerImage: bannerImage ?? this.bannerImage,
      intrinsicImage: intrinsicImage ?? this.intrinsicImage,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  @override
  String toString() {
    return 'ConfigBannerModel(pcWidth: $pcWidth, pcHeight: $pcHeight, pcPosX: $pcPosX, pcPosY: $pcPosY, radiusSize: $radiusSize, elevation: $elevation, elevationOffset: $elevationOffset, primary: $primary, secondary: $secondary, background: $background, designType: $designType, animationType: $animationType, animationCurve: $animationCurve, animationDuration: $animationDuration, bannerImage: $bannerImage, intrinsicImage: $intrinsicImage, fontFamily: $fontFamily)';
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
      elevationOffset,
      primary,
      secondary,
      background,
      designType,
      animationType,
      animationCurve,
      animationDuration,
      bannerImage,
      intrinsicImage,
      fontFamily,
    ];
  }
}
