import 'package:delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius:  BorderRadius.circular(7),
    borderSide:  BorderSide(color: Colors.grey[400]!));

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black)),
    primaryColor: ColorsApp.i.primary,
    colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.i.primary,
        primary: ColorsApp.i.primary,
        secondary: ColorsApp.i.secondary
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.i.primaryButton),
    inputDecorationTheme:InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.i.textRegular.copyWith(color: Colors.black),
      errorStyle: TextStyles.i.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}