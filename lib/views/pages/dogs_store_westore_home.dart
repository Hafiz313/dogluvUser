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
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogsStoreWebstorePage extends StatefulWidget {
  static const id="dogs_store_webstore_home_page";
  @override
  _DogsStoreWebstorePageState createState() => _DogsStoreWebstorePageState();
}

class _DogsStoreWebstorePageState extends State<DogsStoreWebstorePage> {


  StoreOrWebStore selector= StoreOrWebStore.webstore;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body:

    Container(

      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/store_bg.png"),fit: BoxFit.fill
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


              width: AppSizes.appVerticalLg * 4,
              height: 40,
              child: Row(children: [
                Expanded(child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                    ),
                    color:selector==StoreOrWebStore.store ? kYellowColor : Colors.white,
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
                    color:selector==StoreOrWebStore.webstore ? kYellowColor : Colors.white ,
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
                  SizedBox(height: AppSizes.appVerticalLg * .3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text("www.petstore.com",style: boldText(color: kWhiteColor,fontSize: 15),),
                     Image(image: AssetImage("images/card_icon_green.png"),width: AppSizes.appVerticalLg * 0.6,)
                    ],
                  ),

                ],

              ),

            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
                margin: EdgeInsets.all(
             AppSizes.appVerticalLg * 0.5,
                ),
                child: CircleButton(iconData:FontAwesomeIcons.bars,iconColor: Colors.white ,iconSize: 15,)),
          )
        ],
      ),


    ));
  }
}








