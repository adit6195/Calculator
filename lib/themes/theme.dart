import 'package:calculator/themes/widget_themes/outlined_theme.dart';
import 'package:calculator/themes/widget_themes/text_button_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  static ThemeData LightTheme = ThemeData(
    brightness: Brightness.light,
    textButtonTheme: TTextButtonTheme.LightTextButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.LightOutlineButtonTheme
  );

  static ThemeData DarkTheme = ThemeData(
    brightness: Brightness.dark,
    textButtonTheme: TTextButtonTheme.DarkTextButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.DarkOutlineButtonTheme
  );
}