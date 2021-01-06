import 'package:flutter/material.dart';


final Color kColorPrimary = HexColor("#277ab1");
final Color kLightBlue = HexColor("#8ebfdf");
final Color kDialogColorBG = HexColor("#f5f4f4");
final Color kTextBlueColor = HexColor("#607d8b");
final Color kWhiteColor = HexColor("#ffffff");
final Color kGrySlider = HexColor("#868483");
final Color kMenuIconBG = HexColor("#28211a");
final Color kPinkStoreBG = HexColor("#8e44ad");
final Color kGreenBG = HexColor("#1bbc9b");
final Color kPinkSlider = HexColor("#ff66cc");
final Color kBlueColor = HexColor("#09bef8");
final Color kBlackColor = HexColor("#000000");
final Color kBlueColorButton = HexColor("#12405e");
final Color kBgSlider1 = HexColor("#9b59b6");
final Color kColorSliderOneText = HexColor("#d39de9");
final Color kColorSliderTwoText = HexColor("#93f0de");
final Color kColorSliderThreeText = HexColor("#f9e2bd");
final Color kBgSlider2 = HexColor("#1abc9c");
final Color kBgSlider4 = HexColor("#3498db");
final Color kGreenTextBg = HexColor("#60f1d4");
final Color kGreenTextBtn = HexColor("#0f6554");
final Color kYellowTextBG = HexColor("#fff5a5");
final Color kYellowTextBtn = HexColor("#8a5807");
final Color kRedTextBG = HexColor("#f4ba9d");
final Color kRedTextBtn = HexColor("#c04032");
final Color kOrangeColorBar = HexColor("#f38414");
final Color kOrangeColor = HexColor("#d35400");
final Color kYellowColor = HexColor("#f39c12");
final Color kLightBlueColor = HexColor("#09bef8");
final Color kGrayColorBG = HexColor("#383837");
final Color kGrayBgColor = HexColor("#F1F1F1");
final Color kBGColor = HexColor("#f8f8f6");
final Color kPostBG = HexColor("#2d2d2c");
final Color kPostDialogText = HexColor("#bcbcbc");
final Color kPostDialogCross = HexColor("#2980b9");
final Color kPostTextColor = HexColor("#bcbcbc");
final Color kRedColor = HexColor("#e74c3c");
final Color kGrayText = HexColor("#7f90a2");
final Color kGrayBarBg= HexColor("#525250");
final Color kGraySliderColor = HexColor("#7f90a2");


/*final Color kColorPrimary = HexColor("#D82B2B");
final Color kColorAccent = HexColor("#252A2D");
final Color kColorGoogle = HexColor("#4385f6");
final Color kColorFacebook = HexColor("#3b5998");
final Color kColorFB = HexColor("#3b5796");
final Color kColorGN = HexColor("#57399d");
final Color kColorScaffoldBg = HexColor("#181820");*/


class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColor) {
    String _hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (_hexColor.length == 6) {
      _hexColor = "FF$_hexColor";
    }
    return int.parse(_hexColor, radix: 16);
  }
}