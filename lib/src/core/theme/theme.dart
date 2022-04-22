import 'package:flutter/material.dart';
import 'package:obs_animated_banners/src/core/theme/borders.dart';
import 'package:obs_animated_banners/src/core/theme/colors.dart';
import 'package:obs_animated_banners/src/core/theme/text_styles.dart';

final ThemeData materialTheme = ThemeData(
  primaryColor: UiColors.primaryColor,
  colorScheme: const ColorScheme.light(
    primary: UiColors.primaryColor,
    secondary: UiColors.secondaryColor,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: UiColors.primaryColor,
    selectionHandleColor: UiColors.primaryColor,
    selectionColor: UiColors.primaryColor,
  ),
  textTheme: const TextTheme(
    headline1: h1,
    headline2: h2,
    headline3: h3,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: borderSideNormal,
      borderRadius: borderBig,
    ),
    border: OutlineInputBorder(
      borderSide: borderSideNormal,
      borderRadius: borderBig,
    ),
  ),
);
