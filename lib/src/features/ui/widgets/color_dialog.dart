import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:obs_animated_banners/src/features/ui/controller/config_banner_viewmodel.dart';

void colorDialog(Color currentColor, ColorType colorType,
    void Function(ColorType, Color) selectFunction, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(AppLocalizations.of(context)!.pickAColor),
      content: SingleChildScrollView(
        child: ColorPicker(
          hexInputBar: true,
          labelTypes: const [ColorLabelType.rgb, ColorLabelType.hex],
          pickerColor: currentColor,
          onColorChanged: (v) {
            selectFunction(colorType, v);
          },
        ),
      ),
    ),
  );
}
