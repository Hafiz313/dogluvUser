import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/views/pages/create_profile_dog_form.dart';
import 'package:dogluv_user_app/views/pages/create_profile_form.dart';
import 'package:dogluv_user_app/views/pages/create_profile_image_page.dart';
import 'package:dogluv_user_app/views/pages/create_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CreateProfileSliderPage extends StatefulWidget {
  static const id="create_profile_slider_page";

  @override
  _CreateProfileSliderPageState createState() => new _CreateProfileSliderPageState();
}

class _CreateProfileSliderPageState extends State<CreateProfileSliderPage> {


  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _step0(),
      _step1(),
      _step2(),
      _step3(),
    ];
    return Scaffold(
      backgroundColor: kGrayColorBG,
      body: SafeArea(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return steps[index];
          },
          loop: false,
          itemCount: steps.length,
          pagination:SwiperPagination(alignment:Alignment.topCenter,margin: EdgeInsets.only(top: AppSizes.appVerticalLg *0.5)),
        ),
      ),
    );
  }

  Widget _step0() {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: AppSizes.appVerticalLg * 1
      ),
      child: CreateProfilePage(),
    );
  }

  Widget _step1() {
    return Padding(
      padding:  EdgeInsets.only(
          top: AppSizes.appVerticalLg * 0.8,
        bottom: AppSizes.appVerticalLg * 0.3
      ),
      child: CreateProfileFormPage(),
    );
  }

  Widget _step2() {
    return Padding(
      padding:  EdgeInsets.only(
          top: AppSizes.appVerticalLg * 0.8,
          bottom: AppSizes.appVerticalLg * 0.3
      ),
      child: CreateProfileImagePage(),
    );
  }
  Widget _step3() {
    return Padding(
      padding:  EdgeInsets.only(
          top: AppSizes.appVerticalLg * 0.8,
          bottom: AppSizes.appVerticalLg * 0.3
      ),
      child: CreateProfileDogsFormPage(),
    );
  }
}

