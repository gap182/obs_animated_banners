import 'dart:convert';

import 'package:equatable/equatable.dart';

class TextinfoModel extends Equatable {
  final String? title;
  final String? subtitle;
  final int index;
  const TextinfoModel({
    this.title,
    this.subtitle,
    required this.index,
  });

  TextinfoModel copyWith({
    String? title,
    String? subtitle,
    int? index,
  }) {
    return TextinfoModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (subtitle != null) {
      result.addAll({'subtitle': subtitle});
    }
    result.addAll({'index': index});

    return result;
  }

  factory TextinfoModel.fromMap(Map<String, dynamic> map) {
    return TextinfoModel(
      title: map['title'],
      subtitle: map['subtitle'],
      index: map['index']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextinfoModel.fromJson(String source) =>
      TextinfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TextinfoModel(title: $title, subtitle: $subtitle, index: $index)';

  @override
  List<Object?> get props => [title, subtitle, index];
}
