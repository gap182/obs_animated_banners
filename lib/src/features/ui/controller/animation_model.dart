import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AnimationModel extends Equatable {
  const AnimationModel({
    required this.animationController,
  });
  final AnimationController? animationController;

  AnimationModel copyWith({
    AnimationController? animationController,
    bool? locked,
  }) {
    return AnimationModel(
      animationController: animationController ?? this.animationController,
    );
  }

  @override
  List<Object?> get props => [
        animationController,
      ];
}
