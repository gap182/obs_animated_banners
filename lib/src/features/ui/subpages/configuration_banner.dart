import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/theme/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/custom_slider.dart';

class ConfigurationBanner extends ConsumerStatefulWidget {
  const ConfigurationBanner({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConfigurationBannerState();
}

class _ConfigurationBannerState extends ConsumerState<ConfigurationBanner> {
  @override
  Widget build(BuildContext context) {
    final configModel = ref.watch(configBannerPod);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.configuration,
                  style: h1,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.horizontalSize,
                  value: configModel.pcWidth,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.sw, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.verticalSize,
                  value: configModel.pcHeight,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.sh, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.positionX,
                  value: configModel.pcPosX,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.px, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.positionY,
                  value: configModel.pcPosY,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.py, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.roundedBorderPc,
                  min: 0.0,
                  max: 20.0,
                  value: configModel.radiusSize,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.border, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.elevation,
                  min: 0.0,
                  max: 20.0,
                  value: configModel.elevation,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.elevation, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.offsetX,
                  min: 0.0,
                  max: 20.0,
                  value: configModel.elevationOffset.dx,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.offsetX, v),
                ),
                CustomSlider(
                  title: AppLocalizations.of(context)!.offsetY,
                  min: 0.0,
                  max: 20.0,
                  value: configModel.elevationOffset.dy,
                  onChanged: (v) => ref
                      .read(configBannerPod.notifier)
                      .changeSliderValues(SliderType.offsetY, v),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
