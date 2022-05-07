import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'banner_storage.g.dart';

@HiveType(typeId: 1)
class BannerStorage extends Equatable {
  const BannerStorage({
    required this.group,
    required this.texts,
    required this.name,
  });

  @HiveField(0)
  final String name;

  @HiveField(1)
  final Map<String, dynamic> group;

  @HiveField(2)
  final List<Map<String, dynamic>> texts;

  BannerStorage copyWith({
    String? name,
    Map<String, dynamic>? group,
    List<Map<String, dynamic>>? texts,
  }) {
    return BannerStorage(
        group: group ?? this.group,
        texts: texts ?? this.texts,
        name: name ?? this.name);
  }

  @override
  List<Object?> get props => [
        name,
        texts,
        group,
      ];
}
