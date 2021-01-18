

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
import 'package:dogluv_user_app/views/pages/package_leader_page.dart';
import 'package:dogluv_user_app/views/pages/pick_leader_page.dart';
import 'package:dogluv_user_app/views/pages/profile_thanks_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BayPackagePage extends StatelessWidget {
  static const id="bay_package_page";

  @override
  Widget build(BuildContext context) {

    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kBgBlueSlider4,
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
                  child: Text(kBuyPackage,style: simpleText(color: kWhiteColor,fontSize: 18),)
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
                   padding: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 1),
                   child: Image(image: AssetImage("images/buy_package_img.png"),
                   ),
                 ),
                  SizedBox(height: AppSizes.appVerticalLg *0.5,),
                  Text(kTakePart,style: simpleText(color: kWhiteColor),),
                  SizedBox(height: AppSizes.appVerticalLg *0.5,),
                  Text(kBecomingPack,style: simpleText(color: kWhiteColor),),
                  SizedBox(height: AppSizes.appVerticalLg *0.5,),
                  Text(kToDoSo,style: simpleText(color: kWhiteColor),),
                  SizedBox(height: AppSizes.appVerticalLg *1,),
                  Center(child: Text("€3.99",style: boldText(color: kWhiteColor,fontSize: 22),)),
                  SizedBox(height: AppSizes.appVerticalLg *0.5,),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 1.5,
                    ),
                    width: double.infinity,
                    child: roundRectangleBtn(txt: kMAKE_ME_PACK_LEADER,textColor: kLightBlue,bgColor:kWhiteColor,
                        onPressed: (){
                          Navigator.pushNamed(context, PackageLeaderPage.id);
                        }
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
                          Navigator.pushNamed(context, ProfileThanksPage.id);
                        }
                    ),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.5,),




                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
