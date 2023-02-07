import 'package:calculator/resources/colors.dart';
import 'package:flutter/material.dart';


class TOutlineButtonTheme{

  static final LightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: secondaryColor,
      backgroundColor: buttonColorLight,
      padding: EdgeInsets.all(28),
      side: BorderSide(color: buttonColorLight)
    ),
  );

  static final DarkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      backgroundColor: buttonColorDark,
      padding: const EdgeInsets.all(28),
      side: const BorderSide(color: buttonColorDark)
    ),
  );
}