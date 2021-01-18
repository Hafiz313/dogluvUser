import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/create_profile_slider_page.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class IntroScreen extends StatefulWidget {
  static const id="introduction_page";
  @override
  _IntroScreenState createState() => new _IntroScreenState();
}
class _IntroScreenState extends State<IntroScreen> {
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
          pagination:SwiperPagination(margin: EdgeInsets.only(bottom: AppSizes.appVerticalLg *0.5)),
        ),
      ),
    );
  }
  Widget _step0() {
    return Container(
      color: kBgSlider1,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: AppSizes.appVerticalLg * 6.5,
            child: Image(
              image: AssetImage("images/slider1.png")
              ,),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: AppSizes.appVerticalLg * 0.5,
                horizontal: AppSizes.appHorizontalLg * 1.5
            ),
              child:
          Center(child: Text(kImLooking,textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,)))),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kSliderOneText,textAlign:TextAlign.center ,style: simpleText(color: kColorSliderOneText,fontSize: 17))))
        ],
      ),


    );
  }
  Widget _step1() {
    return Container(
      color: kBgSlider2,
      child: Column(
        children: [
          SizedBox(height: AppSizes.appVerticalLg * 1,),

          Image(
            height: AppSizes.appVerticalLg * 5,
            image: AssetImage("images/slider2.png")
            ,),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: AppSizes.appVerticalLg * 0.5,
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kIHaveDog,textAlign:TextAlign.center ,style: boldText(color: kWhiteColor,)))),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 1.5
              ),
              child:
              Center(child: Text(kSliderOneText,textAlign:TextAlign.center ,style: simpleText(color: kColorSliderTwoText,fontSize: 17))))
        ],
      ),


    );
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
              Center(child: Text(kSliderThereText,textAlign:TextAlign.center ,style: simpleText(color: kColorSliderThreeText,fontSize: 17))))
        ],
      ),


    );
  }
  Widget _step3() {
    return  Container(
      color: kBgBlueSlider4,
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
              Center(child: Text(kSliderFourText,textAlign:TextAlign.center  ,style: simpleText(color: kWhiteColor,fontSize: 17)))),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: AppSizes.appVerticalLg * 0.3,bottom:AppSizes.appVerticalLg *0.2 ),
              child: Align(
                alignment:Alignment.bottomRight,
                child:InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, CreateProfileSliderPage.id);

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
          ),

        ],

      ),



    );
  }
}


