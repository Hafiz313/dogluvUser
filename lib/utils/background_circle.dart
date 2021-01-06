import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;
  final Color iconColor;
  final double iconSize;

  const CircleButton({Key key, this.onTap, this.iconData, this.iconColor, this.iconSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 40.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white54,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor ??kWhiteColor,
        ),
      ),
    );
  }
}