import 'package:equatable/equatable.dart';

import 'package:obs_animated_banners/src/features/ui/storage/banner_storage.dart';

class ListGroupModel extends Equatable {
  final List<BannerStorage> groups;
  final int? indexText;
  final int? indexGroup;
  const ListGroupModel({
    required this.groups,
    this.indexText,
    this.indexGroup,
  });

  ListGroupModel copyWith({
    List<BannerStorage>? groups,
    int? indexText,
    int? indexGroup,
  }) {
    return ListGroupModel(
      groups: groups ?? this.groups,
      indexText: indexText ?? this.indexText,
      indexGroup: indexGroup ?? this.indexGroup,
    );
  }

  @override
  String toString() =>
      'ListGroupModel(groups: $groups, indexText: $indexText, indexGroup: $indexGroup)';

  @override
  List<Object?> get props => [groups, indexText, indexGroup];
}
