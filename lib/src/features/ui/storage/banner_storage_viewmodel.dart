import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';

class BannerStorageViewModel extends StateNotifier<BannerStorage> {
  BannerStorageViewModel(BannerStorage bannerStorage) : super(bannerStorage);

  void changeName(String value) {
    state = state.copyWith(name: value);
  }
}
