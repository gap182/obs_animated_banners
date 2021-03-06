import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/animation_model.dart';

class AnimationViewModel extends StateNotifier<AnimationModel> {
  AnimationViewModel(this.ref)
      : super(const AnimationModel(animationController: null));

  final Ref ref;

  void changeController(AnimationController animationController) {
    state = state.copyWith(animationController: animationController);
  }

  void start() {
    final config = ref.read(configBannerPod);
    if (state.animationController != null) {
      state.animationController!.forward();

      if (!config.locked) {
        state.animationController!.addStatusListener((status) async {
          if (status == AnimationStatus.completed) {
            await Future.delayed(
                Duration(milliseconds: config.pauseTime.ceil()));
            back();
          }
        });
      }
    }
  }

  void repeat() {
    if (state.animationController != null) {
      state.animationController!.repeat();
    }
  }

  void reset() {
    if (state.animationController != null) {
      state.animationController!.reset();
    }
  }

  void back() {
    if (state.animationController != null) {
      state.animationController!.reverse();
    }
  }

  void stop() {
    if (state.animationController != null) {
      state.animationController!.stop();
    }
  }
}
