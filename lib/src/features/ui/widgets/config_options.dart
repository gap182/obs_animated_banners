import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/theme/colors.dart';
import 'package:obs_animated_banners/src/core/utils/names_utils.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_viewmodel.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/color_dialog.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/custom_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:obs_animated_banners/src/features/ui/widgets/primary_button.dart';

class ConfigOptions extends ConsumerStatefulWidget {
  const ConfigOptions({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConfigOptionsState();
}

class _ConfigOptionsState extends ConsumerState<ConfigOptions> {
  final durationController = TextEditingController();
  final pauseTimeController = TextEditingController();

  @override
  void dispose() {
    durationController.dispose();
    pauseTimeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    durationController.text =
        ref.read(configBannerPod).animationDuration.toString();
    pauseTimeController.text = ref.read(configBannerPod).pauseTime.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final configModel = ref.watch(configBannerPod);

    return Column(
      children: [
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
          max: 100.0,
          value: configModel.radiusSize,
          onChanged: (v) => ref
              .read(configBannerPod.notifier)
              .changeSliderValues(SliderType.border, v),
        ),
        CustomSlider(
          title: AppLocalizations.of(context)!.borderSize,
          min: 0.0,
          max: 20.0,
          value: configModel.borderSize,
          onChanged: (v) => ref
              .read(configBannerPod.notifier)
              .changeSliderValues(SliderType.borderSize, v),
        ),
        CustomSlider(
          title: AppLocalizations.of(context)!.elevation,
          min: 0.0,
          max: 30.0,
          value: configModel.elevation,
          onChanged: (v) => ref
              .read(configBannerPod.notifier)
              .changeSliderValues(SliderType.elevation, v),
        ),
        CustomSlider(
          title: AppLocalizations.of(context)!.offsetX,
          min: -20.0,
          max: 20.0,
          value: configModel.elevationOffset.dx,
          onChanged: (v) => ref
              .read(configBannerPod.notifier)
              .changeSliderValues(SliderType.offsetX, v),
        ),
        CustomSlider(
          title: AppLocalizations.of(context)!.offsetY,
          min: -20.0,
          max: 20.0,
          value: configModel.elevationOffset.dy,
          onChanged: (v) => ref
              .read(configBannerPod.notifier)
              .changeSliderValues(SliderType.offsetY, v),
        ),
        CustomSlider(
          title: AppLocalizations.of(context)!.fontSize,
          min: 5.0,
          max: 50.0,
          value: configModel.fontSize,
          onChanged: (v) =>
              ref.read(configBannerPod.notifier).changeFontSize(v),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Row(
              children: [
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final color = ref.watch(configBannerPod).primary;
                      return PrimaryButton(
                        onPressed: () {
                          colorDialog(
                              color,
                              ColorType.primary,
                              ref.read(configBannerPod.notifier).changeColor,
                              context);
                        },
                        text: AppLocalizations.of(context)!.primaryColor,
                        color: color,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final color = ref.watch(configBannerPod).secondary;
                      return PrimaryButton(
                        onPressed: () {
                          colorDialog(
                              color,
                              ColorType.secondary,
                              ref.read(configBannerPod.notifier).changeColor,
                              context);
                        },
                        color: color,
                        text: AppLocalizations.of(context)!.secondaryColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Row(
              children: [
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final color = ref.watch(configBannerPod).background;
                      return PrimaryButton(
                        onPressed: () {
                          colorDialog(
                              color,
                              ColorType.background,
                              ref.read(configBannerPod.notifier).changeColor,
                              context);
                        },
                        color: color,
                        text: AppLocalizations.of(context)!.backgroundColor,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final color = ref.watch(configBannerPod).shadowColor;
                      return PrimaryButton(
                        onPressed: () {
                          colorDialog(
                              color,
                              ColorType.shadow,
                              ref.read(configBannerPod.notifier).changeColor,
                              context);
                        },
                        color: color,
                        text: AppLocalizations.of(context)!.shadowColor,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.18,
          child: Row(
            children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final color = ref.watch(configBannerPod).titleColor;
                    return PrimaryButton(
                      onPressed: () {
                        colorDialog(
                            color,
                            ColorType.title,
                            ref.read(configBannerPod.notifier).changeColor,
                            context);
                      },
                      color: color,
                      text: AppLocalizations.of(context)!.titleColor,
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final color = ref.watch(configBannerPod).subtitleColor;
                    return PrimaryButton(
                      onPressed: () {
                        colorDialog(
                            color,
                            ColorType.subtitle,
                            ref.read(configBannerPod.notifier).changeColor,
                            context);
                      },
                      color: color,
                      text: AppLocalizations.of(context)!.subtitleColor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        configModel.designType != DesignType.image
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: Row(
                  children: [
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final bannerImage = ref.watch(configBannerPod
                              .select((value) => value.bannerImage));
                          return PrimaryButton(
                            onPressed: () {
                              ref
                                  .read(configBannerPod.notifier)
                                  .eraseImage(ImageTypeLocal.bannerImage);
                            },
                            color: bannerImage != null
                                ? UiColors.primaryColor
                                : Colors.grey[400],
                            text: AppLocalizations.of(context)!.erase,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          Image? fromPicker =
                              await ImagePickerWeb.getImageAsWidget();
                          ref.read(configBannerPod.notifier).changeImage(
                              fromPicker, ImageTypeLocal.bannerImage);
                        },
                        child: Column(
                          children: [
                            Consumer(
                              builder: (context, ref, child) {
                                final bannerImage = ref.watch(configBannerPod
                                    .select((value) => value.bannerImage));
                                return SizedBox(
                                  height: 100,
                                  child: bannerImage ??
                                      Image.asset(
                                          'assets/images/no_image.jpeg'),
                                );
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!.bannerImage,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 20,
        ),
        configModel.designType == DesignType.image
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.18,
                child: Row(
                  children: [
                    Expanded(
                      child: Consumer(
                        builder: (context, ref, child) {
                          final intrinsicImage = ref.watch(configBannerPod
                              .select((value) => value.intrinsicImage));
                          return PrimaryButton(
                            onPressed: () {
                              ref
                                  .read(configBannerPod.notifier)
                                  .eraseImage(ImageTypeLocal.intrinsicImage);
                            },
                            color: intrinsicImage != null
                                ? UiColors.primaryColor
                                : Colors.grey[400],
                            text: AppLocalizations.of(context)!.erase,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          Image? fromPicker =
                              await ImagePickerWeb.getImageAsWidget();
                          ref.read(configBannerPod.notifier).changeImage(
                              fromPicker, ImageTypeLocal.intrinsicImage);
                        },
                        child: Column(
                          children: [
                            Consumer(
                              builder: (context, ref, child) {
                                final intrinsicImage = ref.watch(configBannerPod
                                    .select((value) => value.intrinsicImage));
                                return SizedBox(
                                  height: 100,
                                  child: intrinsicImage ??
                                      Image.asset(
                                          'assets/images/no_image.jpeg'),
                                );
                              },
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .bannerBackgroundImage,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final items = getAnimations();
            final item = ref.watch(configBannerPod).animationType;
            return DropdownButtonFormField<AnimationType>(
                decoration: InputDecoration(
                  label: Text(AppLocalizations.of(context)!.animationType),
                ),
                value: item,
                items: List.generate(
                  items.length,
                  (index) => DropdownMenuItem<AnimationType>(
                    value: items[index],
                    child: Text(
                      getAnimationName(items[index], context),
                    ),
                  ),
                ),
                onChanged: (v) =>
                    ref.read(configBannerPod.notifier).changeAnimationType(v!));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final items = getDesigns();
            final item = ref.watch(configBannerPod).designType;
            return DropdownButtonFormField<DesignType>(
                decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.designerType)),
                value: item,
                items: List.generate(
                  items.length,
                  (index) => DropdownMenuItem<DesignType>(
                    value: items[index],
                    child: Text(
                      getDesignName(items[index], context),
                    ),
                  ),
                ),
                onChanged: (v) =>
                    ref.read(configBannerPod.notifier).changeDesign(v!));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final items = getAnimationsCurves();
            final item = ref.watch(configBannerPod).animationCurve;
            return DropdownButtonFormField<AnimationCurve>(
                decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.animationCurve)),
                value: item,
                items: List.generate(
                  items.length,
                  (index) => DropdownMenuItem<AnimationCurve>(
                    value: items[index],
                    child: Text(
                      getAnimationCurveName(items[index], context),
                    ),
                  ),
                ),
                onChanged: (v) => ref
                    .read(configBannerPod.notifier)
                    .changeAnimationCurve(v!));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer(
          builder: (context, ref, child) {
            final items = getFontFamilies();
            final item = ref.watch(configBannerPod).fontFamily;
            return DropdownButtonFormField<FontFamily>(
                decoration: InputDecoration(
                    label: Text(AppLocalizations.of(context)!.fontType)),
                value: item,
                items: List.generate(
                  items.length,
                  (index) => DropdownMenuItem<FontFamily>(
                    value: items[index],
                    child: Text(
                      getFontFamilyName(items[index], context),
                    ),
                  ),
                ),
                onChanged: (v) =>
                    ref.read(configBannerPod.notifier).changeFontFamily(v!));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: durationController,
          decoration: InputDecoration(
            label: Text(AppLocalizations.of(context)!.animationDuration),
          ),
          onChanged: (v) {
            final value = double.tryParse(v);
            ref.read(configBannerPod.notifier).changeAnimationDuration(value);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          controller: pauseTimeController,
          decoration: InputDecoration(
            label: Text(AppLocalizations.of(context)!.timePause),
          ),
          onChanged: (v) {
            final value = double.tryParse(v);
            ref.read(configBannerPod.notifier).changePauseTime(value);
          },
        ),
      ],
    );
  }
}
