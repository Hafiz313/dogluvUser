import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/create_profile_slider_page.dart';
import 'package:dogluv_user_app/views/pages/demo_page.dart';
import 'package:dogluv_user_app/views/pages/offer_form_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class LookForPage extends StatelessWidget {
  static const id="look_for_page";
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kTextBlueColor,
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(
                    left: AppSizes.appVerticalLg * 0.5,
                    right: AppSizes.appVerticalLg * 0.5,
                    bottom:  AppSizes.appHorizontalLg * 0.5,

                  ),
                  child: Center(child: Image(
                      width: AppSizes.appHorizontalLg * 6.5,
                      height: AppSizes.appVerticalLg * 5,
                      image:AssetImage("images/look_for_img.png"))),
                ),
                Text(kWhatLook,style: boldText(color: kWhiteColor,fontSize: 20),),
              ],
            ),
          ),
          Expanded(child:Container(
            padding: EdgeInsets.only(
              top: AppSizes.appVerticalLg * 0.3,
              bottom: AppSizes.appVerticalLg * 0.8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 1.2
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kMeet,textColor: kWhiteColor,bgColor:kBgSlider1,onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return OfferFormPage( name:"slkdfj",);}));


                          }),
                        ),
                /*Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 1.2
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kBuy,textColor: kWhiteColor,bgColor:kBgSlider2),
                        ),*/
                Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 1.2
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kSell,textColor: kWhiteColor,bgColor:kOrangeColor,onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return OfferFormPage( name:kSell,);}));
                          }),
                        ),
               /* Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 1.2
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kShareNews,textColor: kWhiteColor,bgColor:kYellowColor),
                        ),*/
                Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 1.2
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kServicesDogs,textColor: kWhiteColor,bgColor:kLightBlueColor),
                        ),


              ],
            ),
          ))
        ],
      ),
    );
  }
}
