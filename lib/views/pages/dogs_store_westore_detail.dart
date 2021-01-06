import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/separator.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogsStoreWebstoreDetail extends StatefulWidget {
  static const id="dogs_store_webstore_detail";
  @override
  _DogsStoreWebstoreDetailState createState() => _DogsStoreWebstoreDetailState();
}

class _DogsStoreWebstoreDetailState extends State<DogsStoreWebstoreDetail> {


  StoreOrWebStore selector= StoreOrWebStore.webstore;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body:

    Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/dog2_bg.png"),fit: BoxFit.fill
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
                  vertical:AppSizes.appVerticalLg * 0.1,
                  horizontal: AppSizes.appHorizontalLg * 0.1
              ),
              margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.4),


              width: AppSizes.appVerticalLg * 4.1,
              height: 40,
              child: Row(children: [
                Expanded(child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                    ),
                    color:selector==StoreOrWebStore.store ? kPinkStoreBG : Colors.white,
                    //  textColor:Colors.black,
                    textColor: selector==StoreOrWebStore.store ? Colors.white : kBlackColor,


                    onPressed:(){
                      setState(() {

                        selector=StoreOrWebStore.store;

                        //  _notifier.signUpGender= "Male";
                      });

                    },
                    child: Text(kSTORE,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                )),
                Expanded(child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),
                    ),
                    color:selector==StoreOrWebStore.webstore ? kPinkStoreBG : Colors.white ,
                    textColor: selector==StoreOrWebStore.webstore ? Colors.white:kBlackColor,
                    disabledTextColor: Colors.white,
                    onPressed:(){
                      setState(() {
                        selector=StoreOrWebStore.webstore;
                        //  _notifier.signUpGender= "Male";
                      });

                    },
                    child: Text(kWEBSOTRE,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                )),



              ],),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: AppSizes.appVerticalLg * 1.5),
              padding: EdgeInsets.only(
                left: AppSizes.appHorizontalLg * 1,
                right: AppSizes.appHorizontalLg * 1,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("$kNameOfStore",style: simpleText(color:kWhiteColor,fontSize: 22),),
                  Text(kActivityChoice,style:simpleText(color:kGraySliderColor) ,),
                  Container(
                      width: double.infinity,
                      child: Text("52 RUE DES FLEURS \n 33500 LIBOURNE \n FRANCE",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,style:simpleText(color:kWhiteColor) ,)),
                  SizedBox(height: AppSizes.appVerticalLg * .3,),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.appVerticalLg * 0.2,
                      horizontal: AppSizes.appHorizontalLg * 0.3,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: AppSizes.appVerticalLg * 0.6,
                              height: AppSizes.appVerticalLg * 0.6,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/profile_man.png",
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            SizedBox(width: AppSizes.appVerticalLg *.1,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Owner",style: simpleText(color: kGrayText),),
                                Text("Jack Ryan",style: simpleText(color: kWhiteColor),),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, PostViewPage.id);
                          },
                          child: Image(
                              width: AppSizes.appHorizontalLg * 0.5,
                              height: AppSizes.appVerticalLg * 0.5,
                              image: AssetImage("images/envelope_icon.png"
                              )),
                        ),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.5,
                            height: AppSizes.appVerticalLg * 0.5,
                            image: AssetImage("images/hard_icon_plus.png"
                            )),
                        Image(
                            width: AppSizes.appHorizontalLg * 0.3,
                            height: AppSizes.appVerticalLg * 0.3,
                            image: AssetImage("images/yellow_left_icon.png"
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * .3,),
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            child:Row(
                              children: [
                                Image(
                                    width: AppSizes.appVerticalLg * 0.4,
                                    height: AppSizes.appVerticalLg * 0.4,
                                    image: AssetImage("images/map_mark.png")),
                                Expanded(child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0
                                    ),
                                    child: MySeparator(color: Colors.grey))),
                                Text("0.5 Kms",style:boldText(color:kWhiteColor,fontSize: 18) ,),

                              ],
                            )

                          )),
                      Expanded(
                        flex: 1,
                          child: Container(
                          )),
                    ],
                  ),
                  SizedBox(height: AppSizes.appVerticalLg * .2,),
                  Text(kText,style: simpleText(color: kGraySliderColor),),
                  SizedBox(height: AppSizes.appVerticalLg * .2,),
                  Row(
                    children: [
                      Text("$kDISCOUNT_CODE :",style: simpleText(color: kWhiteColor,fontSize: 18),),
                      Text(" gh6eryxc5",style: simpleText(color: kWhiteColor)),
                    ],
                  )






                ],

              ),

            ),
          ),

        ],
      ),


    ));
  }
}








