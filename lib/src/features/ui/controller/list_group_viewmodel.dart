import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/features/ui/controller/list_group_model.dart';
import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';

class ListGroupViewModel extends StateNotifier<ListGroupModel> {
  ListGroupViewModel() : super(const ListGroupModel(groups: []));

  void updateGroups(List<BannerStorage> groups) {
    state = state.copyWith(groups: groups);
  }
}
