import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_home.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider1.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogsBuyMeetSlider extends StatefulWidget {
  static const id="dogs_buy_meet_slider";
  @override
  _DogsBuyMeetSliderState createState() => new _DogsBuyMeetSliderState();
}
class _DogsBuyMeetSliderState extends State<DogsBuyMeetSlider> {

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _step0(),
      _step1(),
      _step2(),
      _step3(),
    ];
    return Scaffold(
      body: SafeArea(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return steps[index];
          },
          loop: false,
          itemCount: steps.length,
          pagination:SwiperPagination(margin: EdgeInsets.only(bottom: AppSizes.appVerticalLg * 3.5)),
        ),
      ),
    );
  }
  Widget _step0() {
    return DogsBuyMeetHomePage();
  }
  Widget _step1() {
    return DogsBuyMeetSliderOne();
  }
  Widget _step2() {
    return  Container(
      color: kYellowColor,
      child: Column(
        children: [
          SizedBox(height: AppSizes.appVerticalLg * 2,),

          Container(

            child: Image(
              width: AppSizes.appVerticalLg * 5 ,
              image: AssetImage("images/slider3.png")
              ,),
          ),
          SizedBox(height: AppSizes.appVerticalLg * 1,),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kIWantShare,textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,)))),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1.5,
                vertical: AppSizes.appVerticalLg * 0.5
              ),
              child:
              Center(child: Text(kSliderThereText,textAlign:TextAlign.center ,style: simpleText(color: kColorSliderThreeText,fontSize: 15))))
        ],
      ),


    );
  }
  Widget _step3() {
    return  Container(
      color: kBgSlider4,
      child: Column(
        children: [
          SizedBox(height: AppSizes.appVerticalLg * 1.5,),

          Image(
            height: AppSizes.appVerticalLg * 3,
            image: AssetImage("images/slider4.png")
            ,),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.appVerticalLg * 0.5,
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kIWantSearch,textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,)))),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kSliderFourText,textAlign:TextAlign.center  ,style: simpleText(color: kWhiteColor,fontSize: 15)))),
           Container(

             margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 2,right: AppSizes.appVerticalLg * 0.4),
             alignment: Alignment.bottomRight,
            child:InkWell(
                onTap: (){
                  Navigator.pushNamed(context, LookForPage.id);

                },
                child: Text(kDone,style: simpleText(color: kWhiteColor,fontWeight: FontWeight.w600),)),
          ),
        ],
      ),



    );
  }
}


