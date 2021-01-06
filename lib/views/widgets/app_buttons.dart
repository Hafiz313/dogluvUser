
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




Widget rectangleBtn({
  @required String txt,
  @required GestureTapCallback onPressed,
  Color bgColor,
 // bool progressBar
}) {
  return FlatButton(
    color: bgColor ??kColorPrimary,
    textColor: Colors.white,
    disabledColor: bgColor?? Colors.grey,
    disabledTextColor: Colors.white,
    padding: EdgeInsets.all(8.0),
    onPressed:/*progressBar? null:*/onPressed,
    child:/*progressBar? SpinKitWave(color: Colors.white,size: AppSizes.appVerticalLg *0.55,):*/ Text(txt, style: TextStyle(fontSize: 22),)
  );
}
Widget roundRectangleBtn({
  @required String txt,
  @required GestureTapCallback onPressed,
    Color textColor,
    Color bgColor,
  bool isPadding = true,
  double fontSize,

}) {
  return FlatButton(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.7),

    ),
    color:  bgColor ?? kColorPrimary,
    textColor: textColor ?? Colors.white,
    disabledColor:bgColor ?? Colors.grey ,
    disabledTextColor:textColor ?? Colors.white,
    padding: isPadding ? EdgeInsets.all(AppSizes.appVerticalLg * 0.3):null,
    onPressed:onPressed,
    child: Text(
      txt,
      style: TextStyle(fontSize: 15 ?? fontSize ),
    ),
  );
}
Widget roundTransparentBtn({
  @required String txt,
  @required GestureTapCallback onPressed,
  Color textColor,
  Color bgColor,
  Color borderColor,
  double fontSize,

}) {
  return FlatButton(
    shape: RoundedRectangleBorder(
      side:BorderSide(
          color: borderColor ??kWhiteColor,
          width: 1,
          style: BorderStyle.solid
      ) ,
      borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.7,

      ),



    ),
    color:  bgColor ?? Color(0x00000000),
    textColor: textColor ?? Colors.white,
    disabledColor:bgColor ?? Colors.grey ,
    disabledTextColor:textColor ?? Colors.white,
    padding: EdgeInsets.all(AppSizes.appVerticalLg * 0.3),
    onPressed:onPressed,
    child: Text(
      txt,
      style: TextStyle(fontSize: 15 ?? fontSize ),
    ),
  );
}
