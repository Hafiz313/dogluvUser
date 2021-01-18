import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class ProfileThanksPage extends StatelessWidget {
  static const id="profile_thanks_page";
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroudColor:kBgBlueSlider4 ,
        backgroundImage: false,
        body: Container(
          width: double.infinity,
          child: Stack(

            children: [
              Container(
                  width: double.infinity,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppSizes.appVerticalLg * 1),

                      Text(kThanks,textAlign:TextAlign.center ,style: simpleText(color: kWhiteColor,fontSize: 32)),
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
                      Text("Jack Ryan",textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,fontSize: 28)),
                      Container(
                          padding: EdgeInsets.only(
                            left: AppSizes.appHorizontalLg * 1,
                            right: AppSizes.appHorizontalLg * 1,
                            top: AppSizes.appVerticalLg * 0.1
                          ),
                          child: Text(kThanksProfileText,textAlign:TextAlign.center ,style: simpleText(color: kWhiteColor,fontSize: 20))),
                    ],
                  )),



              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:  EdgeInsets.only(
                    bottom: AppSizes.appVerticalLg * 1.5,
                    left: AppSizes.appHorizontalLg * 0.5,
                    right: AppSizes.appHorizontalLg * 0.5,


                  ),
                  child: Image(
                    height: AppSizes.appVerticalLg * 3.5,
                    image: AssetImage("images/profile_thanks.png")
                    ,),
                ),
              ),
              Align(
                alignment:Alignment.bottomRight,
                child:Padding(
                  padding:  EdgeInsets.only(
                   bottom : AppSizes.appVerticalLg * 0.4,
                   right : AppSizes.appVerticalLg * 0.4,
                  ),
                  child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, DogsBuyMeetSlider.id);

                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: AppSizes.appVerticalLg * 0.15,
                              horizontal: AppSizes.appHorizontalLg * 0.3
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: kWhiteColor)
                          ),

                          child: Icon(FontAwesomeIcons.angleRight,color: Colors.white,))),
                ),
              ),

            ],
          ),
        )
    );
  }
}
