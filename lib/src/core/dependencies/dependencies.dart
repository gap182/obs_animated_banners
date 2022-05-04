import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_viewmodel.dart';

final configBannerPod =
    StateNotifierProvider<ConfigBannerViewModel, ConfigBannerModel>((ref) {
  const initConfigModel = ConfigBannerModel();
  return ConfigBannerViewModel(initConfigModel);
});
