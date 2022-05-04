import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

enum ColorType { primary, secondary, background, shadow, title, subtitle }
enum ImageTypeLocal { bannerImage, intrinsicImage }

class ConfigBannerViewModel extends StateNotifier<ConfigBannerModel> {
  ConfigBannerViewModel(ConfigBannerModel state) : super(state);

  void changeSliderValues(SliderType sliderType, double value) {
    switch (sliderType) {
      case SliderType.px:
        state = state.copyWith(pcPosX: value);
        break;

      case SliderType.py:
        state = state.copyWith(pcPosY: value);
        break;

      case SliderType.sw:
        state = state.copyWith(pcWidth: value);
        break;

      case SliderType.sh:
        state = state.copyWith(pcHeight: value);
        break;

      case SliderType.border:
        state = state.copyWith(radiusSize: value);
        break;

      case SliderType.elevation:
        state = state.copyWith(elevation: value);
        break;

      case SliderType.offsetX:
        state = state.copyWith(
            elevationOffset: Offset(value, state.elevationOffset.dy));
        break;

      case SliderType.offsetY:
        state = state.copyWith(
            elevationOffset: Offset(state.elevationOffset.dx, value));
        break;
      default:
    }
  }

  void changeDesign(DesignType design) {
    state = state.copyWith(designType: design);
  }

  void changeAnimationType(AnimationType animationType) {
    state = state.copyWith(animationType: animationType);
  }

  void changeAnimationCurve(AnimationCurve animationCurve) {
    state = state.copyWith(animationCurve: animationCurve);
  }

  void changeFontFamily(FontFamily fontFamily) {
    state = state.copyWith(fontFamily: fontFamily);
  }

  void changeAnimationDuration(double? duration) {
    state = state.copyWith(animationDuration: duration);
  }

  void changeColor(ColorType colorType, Color color) {
    switch (colorType) {
      case ColorType.primary:
        state = state.copyWith(primary: color);
        break;
      case ColorType.secondary:
        state = state.copyWith(secondary: color);
        break;
      case ColorType.background:
        state = state.copyWith(background: color);
        break;
      case ColorType.shadow:
        state = state.copyWith(shadowColor: color);
        break;
      case ColorType.title:
        state = state.copyWith(titleColor: color);
        break;
      case ColorType.subtitle:
        state = state.copyWith(subtitleColor: color);
        break;
    }
  }

  void changeImage(Image? image, ImageTypeLocal imageType) {
    if (imageType == ImageTypeLocal.bannerImage) {
      state = state.copyWith(bannerImage: image);
    } else if (imageType == ImageTypeLocal.intrinsicImage) {
      state = state.copyWith(intrinsicImage: image);
    }
  }

  void eraseImage(ImageTypeLocal imageTypeLocal) {
    if (imageTypeLocal == ImageTypeLocal.bannerImage) {
      state = state.copyWith(bannerImage: null);
    } else if (imageTypeLocal == ImageTypeLocal.intrinsicImage) {
      state = state.copyWith(intrinsicImage: null);
    }
  }
}
