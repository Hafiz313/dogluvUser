import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/separator.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_detail.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_home.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogsBuyMeetHomePage extends StatefulWidget {
  static const id="dogs_buy_meet_home_page";
  @override
  _DogsBuyMeetHomePageState createState() => _DogsBuyMeetHomePageState();
}

class _DogsBuyMeetHomePageState extends State<DogsBuyMeetHomePage> {

  BuyOrMeet selector= BuyOrMeet.meet;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/dog_bg.png"),fit: BoxFit.cover
          )
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.45,
                right: AppSizes.appVerticalLg * 0.2,
                ),
                child: Icon(FontAwesomeIcons.ellipsisV,color: kWhiteColor,)),

          ),

          Align(
            alignment: Alignment.topCenter,

            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              padding: EdgeInsets.symmetric(
                  vertical:AppSizes.appVerticalLg * 0.1
              ),
              margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.4),


              width: AppSizes.appVerticalLg * 3,
              height: 40,
              child: Row(children: [
                Expanded(child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    left: AppSizes.appVerticalLg *0.1,
                  ),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                      ),
                      color:selector==BuyOrMeet.buy ?kBlueColor : Colors.white,
                    //  textColor:Colors.black,
                     textColor: selector==BuyOrMeet.buy ? Colors.white : kBlackColor,


                      onPressed:(){
                        setState(() {
                          selector=BuyOrMeet.buy;
                        //  _notifier.signUpGender= "Male";
                        });

                      },
                      child: Text(kBUY,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                  ),
                )),
                Expanded(child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      right: AppSizes.appVerticalLg *0.1,

                  ),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                      ),
                      color:selector==BuyOrMeet.meet ? kBlueColor : Colors.white ,
                      textColor: selector==BuyOrMeet.meet ? Colors.white:kBlackColor,
                      disabledTextColor: Colors.white,

                      onPressed:(){
                        setState(() {
                          selector=BuyOrMeet.meet;
                          //  _notifier.signUpGender= "Male";
                        });

                      },
                      child: Text(kMEET,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                  ),
                 )),



              ],),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                left: AppSizes.appHorizontalLg * 1,
                right: AppSizes.appHorizontalLg * 1,
              ),
              height: AppSizes.appVerticalLg * 3.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("$kTommy",style: simpleText(color:kWhiteColor,fontSize: 22),),
                      SizedBox(width: AppSizes.appVerticalLg * 0.1,),
                      Image(
                          width: AppSizes.appVerticalLg * 0.25
                          ,
                          image:AssetImage("images/venus.png")),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(kPomerian,style:simpleText(color:kGraySliderColor) ,),
                              Text(r"$250",style:boldText(color:kWhiteColor,fontSize: 20) ,),

                            ],
                          ),
                          Column(children: [
                            Padding(
                              padding:  EdgeInsets.only(
                                  top: AppSizes.appVerticalLg * 0.3
                              ),
                              child: Text(kAge,style:simpleText(color:kGraySliderColor) ,),
                            ),
                            Text("10",style:simpleText(color:kWhiteColor,fontSize: 20) ,),



                          ],),
                        ],
                      )),
                      Container(
                        margin: EdgeInsets.only(top:  AppSizes.appVerticalLg * 0.2,
                          left:  AppSizes.appVerticalLg * 0.2,
                          right:  AppSizes.appVerticalLg * 0.2,),
                        color: Colors.yellow,
                        height: AppSizes.appVerticalLg * 0.6 ,
                        width: 2.0,
                      ),
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(kColor,style:simpleText(color:kGraySliderColor) ,),
                              Text(kBrown,style:boldText(color:kWhiteColor,fontSize: 20) ,),

                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: kBgSlider2,
                                borderRadius: BorderRadius.circular(20)
                            ),

                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.appVerticalLg * 0.2,
                                vertical: AppSizes.appHorizontalLg * 0.12
                            ),

                            child: InkWell(
                                onTap: (){
                                  //  showAlertDialog(context);
                                },
                                child: Text(kSale,style: boldText(color: kWhiteColor,fontSize: 12),)),
                          )
                        ],
                      )),

                    ],
                  ),
                  SizedBox(height: AppSizes.appHorizontalLg * 0.2,),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kGrayBarBg,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: AppSizes.appHorizontalLg * 0.4,),
                        Padding(
                          padding:  EdgeInsets.symmetric(
                              vertical: AppSizes.appVerticalLg * 0.3
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, PostViewPage.id);
                            },
                            child: Image(
                                width: AppSizes.appHorizontalLg * 0.4,
                                height: AppSizes.appVerticalLg * 0.4,
                                image: AssetImage("images/home.png"
                                )),
                          ),
                        ),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.4,
                            height: AppSizes.appVerticalLg * 0.4,
                            image: AssetImage("images/gray_bar.png"
                            )),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, DogsStoreWebstoreDetail.id);
                          },
                          child: Image(
                              width: AppSizes.appHorizontalLg * 0.4,
                              height: AppSizes.appVerticalLg * 0.4,
                              image: AssetImage("images/hard_icon.png"
                              )),
                        ),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.4,
                            height: AppSizes.appVerticalLg * 0.4,
                            image: AssetImage("images/gray_bar.png"
                            )),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, DogsStoreWebstorePage.id);
                          },
                          child: Image(
                              width: AppSizes.appHorizontalLg * 0.4,
                              height: AppSizes.appVerticalLg * 0.4,
                              image: AssetImage("images/card_icon.png"
                              )),
                        ),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.4,
                            height: AppSizes.appVerticalLg * 0.4,
                            image: AssetImage("images/gray_bar.png"
                            )),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, LookForPage.id);
                          },
                          child: Image(
                              width: AppSizes.appHorizontalLg * 0.4,
                              height: AppSizes.appVerticalLg * 0.4,
                              image: AssetImage("images/add_circle.png"
                              )),
                        ),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.4,
                            height: AppSizes.appVerticalLg * 0.4,
                            image: AssetImage("images/gray_bar.png"
                            )),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.4,
                            height: AppSizes.appVerticalLg * 0.4,
                            image: AssetImage("images/king_icon.png"
                            )),
                        SizedBox(width: AppSizes.appHorizontalLg * 0.3,),


                        Image(
                            width: AppSizes.appHorizontalLg * 0.3,
                            height: AppSizes.appVerticalLg * 0.3,
                            image: AssetImage("images/cross_icon.png"
                            )),



                      ],
                    ),
                  ),

                ],

              ),

            ),
          )
        ],
      ),


    );
  }
}








