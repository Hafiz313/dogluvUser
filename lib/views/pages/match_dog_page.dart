import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';

class MatchDogsPage extends StatefulWidget {
  static const id = "match_dogs_pages";

  @override
  _MatchDogsPageState createState() => _MatchDogsPageState();
}

class _MatchDogsPageState extends State<MatchDogsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundImage: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/match_bg.png"), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.33, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                    width: AppSizes.appVerticalLg * 2,
                    height: AppSizes.appVerticalLg * 2,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kPinkColor, width: 3 // red as border color
                            ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "images/dog_profile.png",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: AppSizes.appVerticalLg * 0.3,
                  ),
                  Text(
                    "Tommy",
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        color: kPinkColor,
                        fontSize: 22),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment(0.33, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                    width: AppSizes.appVerticalLg * 2,
                    height: AppSizes.appVerticalLg * 2,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: kBlueColor, width: 3 // red as border color
                            ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                              "images/dog_profile.png",
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: AppSizes.appVerticalLg * 0.3,
                  ),
                  Text(
                    "Jerry",
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        color: kBlueColor,
                        fontSize: 22),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 2.5),
                    width: double.infinity,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.7),

                      ),
                      color: kWhiteColor,
                      padding: EdgeInsets.symmetric(vertical:AppSizes.appVerticalLg * 0.13,horizontal:AppSizes.appVerticalLg * 0.15 ),

                      onPressed:(){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image(image: AssetImage("images/match_hart_icon.png"),width: AppSizes.appVerticalLg * 0.7,),
                          SizedBox(width: AppSizes.appVerticalLg * 0.27,),
                          Text(
                            "$kSendMessage",
                            style: simpleText(fontSize: 15 ,color: kMatchScreenBlueColor),
                          ),
                        ],
                      ),
                    )
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 2.5),
                    width: double.infinity,
                    child: roundRectangleBtn(
                        txt: kKeepSwiping, bgColor: kWhiteColor,textColor: kMatchScreenBlueColor),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * 0.7,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
