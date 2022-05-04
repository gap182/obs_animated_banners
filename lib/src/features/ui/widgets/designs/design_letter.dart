import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obs_animated_banners/src/core/dependencies/dependencies.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_model.dart';

class DesignLetter extends ConsumerWidget {
  const DesignLetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = ref.watch(configBannerPod);
    return IntrinsicWidth(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
          )),
    );
  }
}
