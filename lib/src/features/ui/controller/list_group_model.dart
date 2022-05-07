import 'package:equatable/equatable.dart';

import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';

class ListGroupModel extends Equatable {
  final List<BannerStorage> groups;
  const ListGroupModel({
    required this.groups,
  });

  ListGroupModel copyWith({
    List<BannerStorage>? groups,
  }) {
    return ListGroupModel(
      groups: groups ?? this.groups,
    );
  }

  @override
  String toString() => 'ListGroupModel(groups: $groups)';

  @override
  List<Object> get props => [groups];
}
