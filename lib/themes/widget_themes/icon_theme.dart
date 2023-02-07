import 'package:calculator/resources/colors.dart';
import 'package:flutter/material.dart';

class TIconTheme{
  
  TIconTheme._();


  static const LightIconTheme = IconThemeData(
    color: secondaryColor,
  );
  static const DarkIconTheme = IconThemeData(
    color: primaryColor,
  );
}