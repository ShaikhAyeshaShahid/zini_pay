import 'package:flutter/material.dart';

class GlobalColors {
  static const Color backgroundColor = Color(0xFF0A466B);
  static const Color buttonColor = Color(0xFF1976D2);
  static const Color primaryColor = Color(0xFF0086CB);
  static const Color textFieldOutlineColor = Color(0xFF108592);
  static const Color greyBgColor = Color(0xFFD3D3D3);
  static const Color selectedDenominationColor = Color(0xFF1976D2);
  static const Color textColor = Color(0xFF36454F);

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0582D2), Color(0xFF0A466B)],
  );

  static TextStyle textStyleField(
      {double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        double? height}) {
    return TextStyle(
      fontSize: fontSize ?? 18,
      color: color ?? GlobalColors.textColor,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle textStyle(
      {double? fontSize,
        Color? color,
        FontWeight? fontWeight,
        double? height}) {
    return TextStyle(
      fontSize: fontSize ?? 24,
      color: color ?? GlobalColors.textColor,
      fontWeight: fontWeight ?? FontWeight.w800,
    );
  }
}