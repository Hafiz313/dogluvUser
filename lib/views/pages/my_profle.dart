import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  static const id="my_profile_page";
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroudColor:kGrayColorBG ,
        backgroundImage: false,
        body:SingleChildScrollView(
          child: Column
            (children: [



            Container(
              color:kBgBlueSlider4 ,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    padding: EdgeInsets.all(AppSizes.appVerticalLg * 0.4,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: kWhiteColor,
                          size: 20,
                        ),
                        Text(kMyProfile,textAlign:TextAlign.center ,style: simpleText(color: kWhiteColor,fontSize: 25)),
                        Icon(
                          FontAwesomeIcons.times,
                          color: kWhiteColor,
                          size: 20,
                        ),

                      ],),
                  ),


                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: AppSizes.appVerticalLg * 0.5),
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.3),
                            width: AppSizes.appVerticalLg * 2,
                            height: AppSizes.appVerticalLg * 2,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: kBlueColor,  // red as border color
                                ),
                                shape: BoxShape.circle,
                                image:DecorationImage(
                                    image: AssetImage("images/profile_img.png",),
                                    fit: BoxFit.fill

                                )
                            ),

                          ),
                          SizedBox(height: AppSizes.appVerticalLg * 0.3),
                          Text("Jack Ryan",textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,fontSize: 25)),

                        ],
                      )),

                ],
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                color:kProfileGray,
                borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 0.6,
                  vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
                Expanded(
                  child: Row(
                  children: [
                    Image(image:AssetImage("images/green_envolpe_icon.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kMassageCenter,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

              ),
                ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/announces_icon.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kAnnounces,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/profile_pink_icon.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kProfile,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/finances_icon.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kFinances,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/language_choice.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kLanguageChoice,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/informations.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kInformation,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .25,),
            Container(
              decoration: BoxDecoration(
                  color:kProfileGray,
                  borderRadius: BorderRadius.circular(10)
              ),

              margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6,
                vertical: AppSizes.appHorizontalLg * 0.6,
              ),
              child:
              Expanded(
                child: Row(
                  children: [
                    Image(image:AssetImage("images/logout.png"),
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Expanded(child: Container(
                        alignment: Alignment.center,
                        child: Text(kLogout,style: boldText(color:kWhiteColor),))),
                    Container(width:  AppSizes.appVerticalLg * 0.4 ,)

                  ],

                ),
              ),
            ),
            SizedBox(height: AppSizes.appHorizontalLg * .4,),


          ],),
        )
    );
  }
}
