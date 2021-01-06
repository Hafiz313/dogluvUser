import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/permissin_notification_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/dialog_box_location.dart';
import 'package:flutter/material.dart';



class PermissionLocationPage extends StatelessWidget {
  static const id="permission_location_page";
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: AppSizes.appHorizontalLg * .6
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image(
              width: AppSizes.appHorizontalLg * 4,
              height: AppSizes.appVerticalLg * 4,
              image: AssetImage("images/logo2.png"),
            ),
            SizedBox(height: AppSizes.appVerticalLg * 0.4,),

            Card(
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
                    child: roundRectangleBtn(txt: kAllow, onPressed: (){
                      Navigator.pushNamed(context, PermissionNotificationPage.id);
                    },bgColor: kLightBlue),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.25,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 1
                    ),
                    width: double.infinity,
                    child: roundRectangleBtn(txt: kDnAllow, onPressed: (){
                      Navigator.pushNamed(context, PermissionNotificationPage.id);
                    },bgColor: kBlueColorButton),
                  )

                ],),
              ),
            )

          ],
        ),
      ),
    );
  }
}


