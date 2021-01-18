import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class DialogBoxLocation extends StatelessWidget {
  const DialogBoxLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
      color: kWhiteColor,
      child: Padding(
        padding:  EdgeInsets.symmetric(

          vertical: AppSizes.appVerticalLg * 0.7,
          horizontal: AppSizes.appHorizontalLg * 0.5,
        ),
        child: Column(children: [
          Text(kLocationPermissionText,style: simpleText(color: kTextBlueColor,fontSize: 16),),
          SizedBox(height: AppSizes.appVerticalLg * 0.5,),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.appHorizontalLg * 1
            ),
            width: double.infinity,
            child: roundRectangleBtn(txt: kAllow, onPressed: null,bgColor: kLightBlue),
          ),
          SizedBox(height: AppSizes.appVerticalLg * 0.25,),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 1
            ),
            width: double.infinity,
            child: roundRectangleBtn(txt: kDnAllow, onPressed: null,bgColor: kBlueColorButton),
          )

        ],),
      ),
    );
  }
}