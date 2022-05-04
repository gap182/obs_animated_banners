import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_container.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_container_divide.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_image.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_letter.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/designs/design_letter_divide.dart';

class BackgroundSide extends ConsumerWidget {
  const BackgroundSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valuesConfig = ref.watch(configBannerPod);
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: Stack(
        children: [
          Container(
            color: ref.watch(configBannerPod).background,
          ),
          Positioned(
              left: size.width * valuesConfig.pcPosX,
              bottom: size.height * valuesConfig.pcPosY,
              child: _getBanner(valuesConfig, size) ?? const SizedBox.shrink())
        ],
      ),
    );
  }

  Widget? _getBanner(ConfigBannerModel values, Size size) {
    switch (values.designType) {
      case DesignType.image:
        return const DesignImage();

      case DesignType.container:
        return const DesignContainer();
      case DesignType.containerDivide:
        return const DesignContainerDivide();
      case DesignType.letter:
        return const DesignLetter();
      case DesignType.letterDivide:
        return const DesignLetterDivide();
      default:
    }
  }
}
