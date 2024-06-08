import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: lBgColor,
    primary: lPrimaryColor,
    onSurface: lFontColor,
    primaryContainer: lDivColor,
    onPrimaryContainer: lFontColor,
    onSecondaryContainer: lLabelColor,
  ),
);
var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: dBgColor,
    primary: dPrimaryColor,
    onSurface: dFontColor,
    primaryContainer: dDivColor,
    onPrimaryContainer: dFontColor,
    onSecondaryContainer: dLabelColor,
  ),
);
