import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

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
}
