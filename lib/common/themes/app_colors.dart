import 'package:flutter/material.dart';

class AppColors {
  static Color bgScreen = hexToColor("FFFFFF");

  /* Accent Color */
  static Color primaryAccent = hexToColor("#4C83FF");
  static Color purpleAccent = hexToColor("#C49DFC");
  static Color accentOtherOne = hexToColor("#F0B29B");
  static Color otherPrimary = hexToColor("#D2D7E1");

  /* Background Color */
  static Color background = hexToColor("#272C36");
  static Color backgroundSurfaceOne = hexToColor("#1E222C");
  static Color backgroundSurfaceTwo = hexToColor("#060A14");
  static Color backgroundSurfaceThree = hexToColor("#2B364C");

  /* Feedback Color */
  static Color feedbackInfo = hexToColor("#80CEE4");
  static Color feedbackSuccess = hexToColor("#7CC2C2");
  static Color feedbackError = hexToColor("#E78F99");
  static Color feedbackAlert = hexToColor("#EEC39D");

  /* Neutral Color */
  static Color neutralSeventy = hexToColor("#616161");
  static Color neutralWhite = hexToColor("#FFFFFF");
  static Color shadow = const Color.fromRGBO(190, 190, 190, 0.16);

  /* Button Color */
  static Color disableButton = hexToColor("#434751");
  static Color disableButtonText = hexToColor("#5F646E");
  static Color otherOne = hexToColor("#F9932C");
  static Color otherTwo = hexToColor("#EC4646");
  static Color otherThree = hexToColor("#00917C");

  /* Line Color */
  static Color line = hexToColor("#171B25");
  static Color lineDark = hexToColor("#121212");

  static Color textTitle = hexToColor("#1D334F");
  static Color textSubtitle = hexToColor("#002060");
  static Color textPrimary = hexToColor("#597393");
  static Color textSecondary = hexToColor("#5F5F5F");
  static Color textTertiary = hexToColor("#BEBEBE");
  static Color textQuartenary = hexToColor("#858993");
  static Color textTertiaryDark = hexToColor("#A6A6A6");
  
  /* Converter Function */
  static Color hexToColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16) + 0xFF000000);
  }
}