import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_home.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_page.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_detail.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_home.dart';
import 'package:dogluv_user_app/views/pages/forget_password_page.dart';
import 'package:dogluv_user_app/views/pages/create_profile_page.dart';
import 'package:dogluv_user_app/views/pages/create_profile_slider_page.dart';
import 'package:dogluv_user_app/views/pages/demo_page.dart';
import 'package:dogluv_user_app/views/pages/create_profile_form.dart';
import 'package:dogluv_user_app/views/pages/intro_slider_page.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/message_report_page.dart';
import 'package:dogluv_user_app/views/pages/message_view_page.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/pages/offer_form_page.dart';
import 'package:dogluv_user_app/views/pages/permissin_location_page.dart';
import 'package:dogluv_user_app/views/pages/permissin_notification_page.dart';
import 'package:dogluv_user_app/views/pages/post_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/pages/profile_thanks_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/pages/report_view_page.dart';
import 'package:dogluv_user_app/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),

  ], child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomePage.id :(context)=> WelcomePage(),
        SignInPage.id :(context)=> SignInPage(),
        RegisterPage.id :(context)=> RegisterPage(),
        CreateProfileFormPage.id :(context)=> CreateProfileFormPage(),
        PermissionLocationPage.id :(context)=> PermissionLocationPage(),
        PermissionNotificationPage.id :(context)=> PermissionNotificationPage(),
        IntroScreen.id :(context)=> IntroScreen(),
        LookForPage.id :(context)=> LookForPage(),
        CreateProfilePage.id :(context)=> CreateProfilePage(),
        DemoPage.id :(context)=> DemoPage(),
        ForgetPasswordPage.id :(context)=> ForgetPasswordPage(),
        CreateProfileSliderPage.id :(context)=> CreateProfileSliderPage(),
        DogsBuyMeetPage.id :(context)=> DogsBuyMeetPage(),
        DogsBuyMeetSlider.id :(context)=> DogsBuyMeetSlider(),
        ProfileThanksPage.id :(context)=> ProfileThanksPage(),
        DogsBuyMeetHomePage.id :(context)=> DogsBuyMeetHomePage(),
        PostViewPage.id :(context)=> PostViewPage(),
        MessageViewPage.id :(context)=> MessageViewPage(),
        MessageReportPage.id :(context)=> MessageReportPage(),
        ReportViewPage.id :(context)=> ReportViewPage(),
        DogsStoreWebstorePage.id :(context)=> DogsStoreWebstorePage(),
        DogsStoreWebstoreDetail.id :(context)=> DogsStoreWebstoreDetail(),
        OfferFormPage.id :(context)=> OfferFormPage(),
        PostPage.id :(context)=> PostPage(),
        MyProfilePage.id :(context)=> MyProfilePage(),
      },

    );
  }
}
