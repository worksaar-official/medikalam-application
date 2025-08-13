// Flutter imports:
import 'package:flutter/material.dart';

/// A class that provides utility functions for working with colors.
class AppColors {
  static Color textPrimary = hexToColor("#203144");
  static Color txtPrimary = hexToColor('#18A0FB');
  static Color txtSecondary = hexToColor('#5C5C5C');
  static Color navText = hexToColor('#203144');
  static Color txtLabel = hexToColor('#526780');
  static Color txtWhite = hexToColor('#FFFFFF');
  static Color blackColor = hexToColor('#11182E');
  static Color documentColor = hexToColor('#35455B');
  static Color subTitle = hexToColor('#94A3B8');
  static Color buttonText = hexToColor("#F4F4F4");
  static Color redText = hexToColor('#AA0107');
  static Color calendarColor = hexToColor("#4A5660");
  static Color calendarDay = hexToColor("#B5BEC6");

  //Button Color
  static Color btnPrimary = hexToColor('#18A0FB');
  static Color inactiveBtn = hexToColor("#94A3B8");
  static Color btnSecondary = hexToColor('#E9EDF3');

  //Icons & Vectors Color
  static Color iconPrimary = hexToColor('#18A0FB');

  //Background Color
  static Color backgroundPrimary = hexToColor('#18A0FB');
  static Color dividerPrimary = hexToColor('#E9EDF3');
  static Color contPrimary = hexToColor('#E2E8F0');
  static Color lightSky = hexToColor('#DEF2FF');
  static Color navShadow = hexToColor('#FEFEFE');
  static Color searchBgColor = hexToColor('#F1F5F9');
  static Color borderColor = hexToColor('#E2E8F0');

  //Solid Color
  static Color lightSolid = hexToColor('#E9EDF3');
  static Color lightGrey = hexToColor('#A9A9A9');
  static Color solidGrey = hexToColor('#3B3B3B');

  static Color redBtn = hexToColor('#FEF2F2');
  static Color bloodRed = hexToColor('#EE1919');
  static Color offWhite = hexToColor('#F1F5F9');
  static Color white = hexToColor('#FBFAFC');
  static Color green = hexToColor('#76D21B');

  static Color success = hexToColor('#02B772');
  static Color error = hexToColor('#EF4444');

  ///Function For Hex To Color
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
