import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/demo_page.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_page.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  static const id="welcome_page";
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return BaseScaffold(
      internetFunction: false,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: AppSizes.appVerticalLg * 0.6
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: AppSizes.appVerticalLg *3.5,),
              Container(
                height: AppSizes.appVerticalLg * 3.5,
                width: AppSizes.appVerticalLg * 5,
                child: Image(
                  image: AssetImage("images/logo.png"),
                ),
              ),
              SizedBox(height: AppSizes.appVerticalLg *.7,),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 1
                ),
                width: double.infinity,
                child: roundRectangleBtn(textColor: kBlueColorButton,txt: kSignIn,bgColor: kLightBlue,onPressed: (){
                  Navigator.pushNamed(context, SignInPage.id);
                }),
              ),
              SizedBox(height: AppSizes.appVerticalLg *.3,),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1
                ),
                width: double.infinity,
                child: roundRectangleBtn(txt: kRegister,bgColor: Colors.white,textColor: kBlueColorButton,onPressed: (){
                  Navigator.pushNamed(context, RegisterPage.id);
                }),
              ),
              SizedBox(height: AppSizes.appVerticalLg *.4,),
              Container(
                child:Text(kTermsOfService,style:textTitle(fontSize: 13,color: Colors.white,underLine: true),),
              ),
              SizedBox(height: AppSizes.appVerticalLg *.4,),
            ],
          ),
        ),
      ),
    );
  }
}
