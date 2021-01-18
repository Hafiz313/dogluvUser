

import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/profile_thanks_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PackageLeaderPage extends StatelessWidget {
  static const id="package_leader_page";

  @override
  Widget build(BuildContext context) {

    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.appVerticalLg * 0.3,
                    vertical: AppSizes.appVerticalLg * 0.3,
                  ),
                  child: Image(image: AssetImage("images/arrow_icon.png"),width: AppSizes.appVerticalLg * 0.4,))
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: AppSizes.appVerticalLg * 0.3,
                    vertical: AppSizes.appVerticalLg * 0.3,
                  ),
                  child: Text(kPosts,style: simpleText(color: kWhiteColor,fontSize: 18),)
          )
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: EdgeInsets.all(
                  AppSizes.appVerticalLg * 0.5,
                ),
                child: CircleButton(iconData:FontAwesomeIcons.bars,iconColor: Colors.white ,iconSize: 15,)),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 1),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.4,
                vertical: AppSizes.appVerticalLg * 0.2
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    height: AppSizes.appVerticalLg * 3,
                    width: double.infinity,
                    padding: EdgeInsets.all(
                      AppSizes.appVerticalLg * 0.3
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("images/basic_post.png"),
                        fit: BoxFit.fill
                      )

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kBasicPost, style: simpleText(color: kGreenTextBg),),
                        SizedBox(height: AppSizes.appVerticalLg * 0.1,),
                        Row(
                          children: [
                            Image(image: AssetImage("images/clock_blue.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("72h",style: simpleText(color:kWhiteColor,fontSize: 20),),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/vertical_bar_blue.png"),height: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/basic_blue.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("€6",style: simpleText(color:kWhiteColor,fontSize: 20),),


                          ],

                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.4,),
                        roundRectangleBtn(txt: kSELECT, onPressed: null,bgColor:kWhiteColor,textColor: kBlueTextPostBtnColor,isPadding: false)
                      ],
                    ),

                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                  Container(
                    height: AppSizes.appVerticalLg * 3,
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        AppSizes.appVerticalLg * 0.3
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/standerdpost.png"),
                            fit: BoxFit.fill
                        )

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kStandardPost, style: simpleText(color: kGreenTextBg),),
                        SizedBox(height: AppSizes.appVerticalLg * 0.1,),
                        Row(
                          children: [
                            Image(image: AssetImage("images/watch_green_icon.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("72h",style: simpleText(color:kWhiteColor,fontSize: 20),),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/vertical_bar_green.png"),height: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/green_card_icon.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("€6",style: simpleText(color:kWhiteColor,fontSize: 20),),


                          ],

                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.4,),
                        roundRectangleBtn(txt: kSELECT, onPressed: null,bgColor:kWhiteColor,textColor: kGreenTextBtn,isPadding: false)
                      ],
                    ),

                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                  Container(
                    height: AppSizes.appVerticalLg * 3,
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        AppSizes.appVerticalLg * 0.3
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/Superiorpost.png"),
                            fit: BoxFit.fill
                        )

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kSuperiorPost, style: simpleText(color: kYellowTextBG),),
                        SizedBox(height: AppSizes.appVerticalLg * 0.1,),
                        Row(
                          children: [
                            Image(image: AssetImage("images/watch_icon_yellow.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("72h",style: simpleText(color:kWhiteColor,fontSize: 20),),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/vertical_bar_yellow.png"),height: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/card_icon_yellow.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("€6",style: simpleText(color:kWhiteColor,fontSize: 20),),


                          ],

                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.4,),
                        roundRectangleBtn(txt: kSELECT, onPressed: null,bgColor:kWhiteColor,textColor: kYellowTextBtn,isPadding: false)
                      ],
                    ),

                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                  Container(
                    height: AppSizes.appVerticalLg * 3,
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        AppSizes.appVerticalLg * 0.3
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("images/premiumpost.png"),
                            fit: BoxFit.fill
                        )

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(kPremiumPost, style: simpleText(color: kRedTextBG),),
                        SizedBox(height: AppSizes.appVerticalLg * 0.1,),
                        Row(
                          children: [
                            Image(image: AssetImage("images/watch_icon_red.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("72h",style: simpleText(color:kWhiteColor,fontSize: 20),),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/vertical_bar_icon.png"),height: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.25,),
                            Image(image: AssetImage("images/card_icon_red.png"),width: AppSizes.appVerticalLg * 0.5,),
                            SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                            Text("€6",style: simpleText(color:kWhiteColor,fontSize: 20),),


                          ],

                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.4,),
                        roundRectangleBtn(txt: kSELECT, onPressed: null,bgColor:kWhiteColor,textColor: kRedTextBtn,isPadding: false)
                      ],
                    ),

                  ),
                  SizedBox(height: AppSizes.appVerticalLg *1,),
                  Container(
                    alignment: Alignment.center,
                    child:Text(kTermsOfService,style:textTitle(fontSize: 13,color: Colors.white,underLine: true),),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.5,),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 2.5,
                    ),
                    width: double.infinity,
                    child: roundRectangleBtn(txt: kCONFIRM,textColor: kLightBlue,bgColor:kWhiteColor,
                        onPressed: (){
                         // Navigator.pushNamed(context, ProfileThanksPage.id);
                        }
                    ),
                  ),




                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
