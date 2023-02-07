import 'package:calculator/resources/colors.dart';
import 'package:flutter/material.dart';

class TTextButtonTheme{
  TTextButtonTheme._();

  static final LightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: secondaryColor,
      padding: EdgeInsets.all(27),
    ),
  );

  static final DarkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: primaryColor,
      padding: EdgeInsets.all(27),
    ),
  );
}