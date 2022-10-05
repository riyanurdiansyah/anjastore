import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyleText {
  static styleAbeezee({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? locale,
    double? height,
  }) {
    return GoogleFonts.aBeeZee(
      fontStyle: fontStyle ?? FontStyle.normal,
      locale: Locale(locale ?? 'ID'),
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1.0,
    );
  }

  static styleLato({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? locale,
    double? height,
  }) {
    return GoogleFonts.lato(
      fontStyle: fontStyle ?? FontStyle.normal,
      locale: Locale(locale ?? 'ID'),
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1.0,
    );
  }

  static stylePoppins({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? locale,
    double? height,
  }) {
    return GoogleFonts.poppins(
      fontStyle: fontStyle ?? FontStyle.normal,
      locale: Locale(locale ?? 'ID'),
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1.0,
    );
  }

  static styleAdventPro({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? locale,
    double? height,
  }) {
    return GoogleFonts.adventPro(
      fontStyle: fontStyle ?? FontStyle.normal,
      locale: Locale(locale ?? 'ID'),
      fontSize: fontSize ?? 12,
      color: color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      height: height ?? 1.0,
    );
  }
}
