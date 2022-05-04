import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

class DesignContainer extends ConsumerWidget {
  const DesignContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    final size = MediaQuery.of(context).size;
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Texto de prueba",
                      style: TextStyle(
                        color: values.titleColor,
                        fontFamily: values.fontFamily.toShortString(),
                        fontSize: values.fontSize * 1.3,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Descripción de prueba",
                      style: TextStyle(
                        color: values.subtitleColor,
                        fontFamily: values.fontFamily.toShortString(),
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
