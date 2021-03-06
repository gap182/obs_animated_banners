import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:obs_animated_banners/src/features/ui/controller/animation_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/animation_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/controller/list_group_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/list_group_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/controller/textinfo_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/textinfo_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/storage/crud.dart';

final configBannerPod =
    StateNotifierProvider<ConfigBannerViewModel, ConfigBannerModel>((ref) {
  const initConfigModel = ConfigBannerModel();
  return ConfigBannerViewModel(initConfigModel);
});

final animationPod = Provider.family<Tween<double>, Size>((ref, size) {
  final animationType =
      ref.watch(configBannerPod.select((value) => value.animationType));

  switch (animationType) {
    case AnimationType.slideXLR:
      final pcPosX = ref.watch(configBannerPod.select((value) => value.pcPosX));
      final pcWidth =
          ref.watch(configBannerPod.select((value) => value.pcWidth));
      return Tween<double>(
          begin: -pcWidth * size.width - 20, end: pcPosX * size.width);

    case AnimationType.slideXRL:
      final pcPosX = ref.watch(configBannerPod.select((value) => value.pcPosX));
      return Tween<double>(begin: size.width + 20, end: pcPosX * size.width);

    case AnimationType.slideYBT:
      final pcPosY = ref.watch(configBannerPod.select((value) => value.pcPosY));
      final pcHeight =
          ref.watch(configBannerPod.select((value) => value.pcHeight));
      return Tween<double>(
          begin: -pcHeight * size.height - 10, end: pcPosY * size.height);

    case AnimationType.slideYTB:
      final pcPosY = ref.watch(configBannerPod.select((value) => value.pcPosY));
      return Tween<double>(begin: size.height + 20, end: pcPosY * size.height);

    case AnimationType.visibility:
      return Tween<double>(begin: 0.0, end: 1.0);

    case AnimationType.increase:
      return Tween<double>(begin: 0.0, end: 1.0);

    default:
      return Tween(begin: 0.0, end: 200);
  }
});

final animationControllerPod =
    StateNotifierProvider<AnimationViewModel, AnimationModel>((ref) {
  return AnimationViewModel(ref);
});

final textinfoPod =
    StateNotifierProvider<TextinfoViewModel, TextinfoModel>((ref) {
  return TextinfoViewModel(const TextinfoModel(index: 0));
});

final hivePod = FutureProvider<Box<BannerStorage>>((ref) async {
  final box = await Hive.openBox<BannerStorage>('banner');
  return box;
});

final crudPod = FutureProvider((ref) async {
  final crud = Crud(ref);
  await crud.init();
  return crud;
});

final crudProvider = Provider((ref) => Crud(ref));

final bannerStoragePod =
    StateNotifierProvider<BannerStorageViewModel, BannerStorage>((ref) {
  return BannerStorageViewModel(
      const BannerStorage(group: {}, texts: [], name: ''));
});

final listGroupPod =
    StateNotifierProvider<ListGroupViewModel, ListGroupModel>((ref) {
  return ListGroupViewModel();
});
