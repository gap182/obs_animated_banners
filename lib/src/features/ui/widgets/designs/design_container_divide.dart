import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/core/utils/common_extensions.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

class DesignContainerDivide extends ConsumerWidget {
  const DesignContainerDivide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    final size = MediaQuery.of(context).size;
    final fontFamily = values.fontFamily.toShortString().replaceFirst(
        values.fontFamily.toShortString()[0],
        values.fontFamily.toShortString()[0].toUpperCase());

    final title = ref.watch(textinfoPod.select((value) => value.title));
    final subtitle = ref.watch(textinfoPod.select((value) => value.subtitle));
    return Container(
      width: size.width * values.pcWidth,
      height: size.height * values.pcHeight,
      decoration: BoxDecoration(
        color: values.primary,
        borderRadius: BorderRadius.circular(values.radiusSize),
        border: values.borderSize == 0
            ? null
            : Border.all(
                color: values.secondary,
                width: values.borderSize,
              ),
        boxShadow: [
          BoxShadow(
            color:
                values.elevation != 0 ? values.shadowColor : Colors.transparent,
            offset: values.elevationOffset,
            blurRadius: values.elevation,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Row(
            children: [
              values.bannerImage != null
                  ? SizedBox(
                      width: size.width * values.pcWidth * 0.3,
                      height: size.height * values.pcHeight * 0.8,
                      child: Image.memory(values.bannerImage!),
                    )
                  : const SizedBox.shrink(),
              Container(
                width: 4.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: values.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                        color: values.titleColor,
                        fontFamily: fontFamily,
                        fontSize: values.fontSize * 1.3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      subtitle ?? '',
                      style: TextStyle(
                        color: values.subtitleColor,
                        fontFamily: fontFamily,
                        fontSize: values.fontSize,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
