import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AnimationModel extends Equatable {
  const AnimationModel({
    required this.animationController,
    this.locked = false,
  });
  final AnimationController? animationController;
  final bool locked;

  AnimationModel copyWith({
    AnimationController? animationController,
    bool? locked,
  }) {
    return AnimationModel(
      animationController: animationController ?? this.animationController,
      locked: locked ?? this.locked,
    );
  }

  @override
  List<Object?> get props => [animationController, locked];
}
