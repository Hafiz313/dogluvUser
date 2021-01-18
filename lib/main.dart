import 'dart:ffi';

import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/shared_preferences.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/bay_package.dart';
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
import 'package:dogluv_user_app/views/pages/match_dog_page.dart';
import 'package:dogluv_user_app/views/pages/message_report_page.dart';
import 'package:dogluv_user_app/views/pages/message_view_page.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/pages/offer_form_page.dart';
import 'package:dogluv_user_app/views/pages/permissin_location_page.dart';
import 'package:dogluv_user_app/views/pages/permissin_notification_page.dart';
import 'package:dogluv_user_app/views/pages/pick_leader_page.dart';
import 'package:dogluv_user_app/views/pages/package_leader_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/pages/profile_thanks_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/pages/report_view_page.dart';
import 'package:dogluv_user_app/views/pages/search_form_page.dart';
import 'package:dogluv_user_app/views/pages/sell_services_page.dart';
import 'package:dogluv_user_app/views/pages/send_request_page.dart';
import 'package:dogluv_user_app/views/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:io';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthViewModel()),
  ], child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // onGenerateRoute: WelcomePage(),
      // initialRoute: isWelcomeOrHome ? DogsBuyMeetSlider.id : WelcomePage.id,
      debugShowCheckedModeBanner: false,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        SignInPage.id: (context) => SignInPage(),
        RegisterPage.id: (context) => RegisterPage(),
        CreateProfileFormPage.id: (context) => CreateProfileFormPage(),
        PermissionLocationPage.id: (context) => PermissionLocationPage(),
        PermissionNotificationPage.id: (context) =>
            PermissionNotificationPage(),
        IntroScreen.id: (context) => IntroScreen(),
        LookForPage.id: (context) => LookForPage(),
        CreateProfilePage.id: (context) => CreateProfilePage(),
        DemoPage.id: (context) => DemoPage(),
        ForgetPasswordPage.id: (context) => ForgetPasswordPage(),
        CreateProfileSliderPage.id: (context) => CreateProfileSliderPage(),
        DogsBuyMeetPage.id: (context) => DogsBuyMeetPage(),
        DogsBuyMeetSlider.id: (context) => DogsBuyMeetSlider(),
        ProfileThanksPage.id: (context) => ProfileThanksPage(),
        DogsBuyMeetHomePage.id: (context) => DogsBuyMeetHomePage(),
        PostViewPage.id: (context) => PostViewPage(),
        MessageViewPage.id: (context) => MessageViewPage(),
        MessageReportPage.id: (context) => MessageReportPage(),
        ReportViewPage.id: (context) => ReportViewPage(),
        DogsStoreWebstorePage.id: (context) => DogsStoreWebstorePage(),
        DogsStoreWebstoreDetail.id: (context) => DogsStoreWebstoreDetail(),
        OfferFormPage.id: (context) => OfferFormPage(),
        PackageLeaderPage.id: (context) => PackageLeaderPage(),
        MyProfilePage.id: (context) => MyProfilePage(),
        SellServicesPage.id: (context) => SellServicesPage(),
        PickLeaderPage.id: (context) => PickLeaderPage(),
        BayPackagePage.id: (context) => BayPackagePage(),
        SearchFormPage.id: (context) => SearchFormPage(),
        SendRequestFormPage.id: (context) => SendRequestFormPage(),
        MatchDogsPage.id: (context) => MatchDogsPage(),
        // PackageLeaderPage.id :(context)=> PackageLeaderPage(),
      },
      home:StatUpLogic() ,
    );


  }
}


class StatUpLogic extends StatelessWidget {
  const StatUpLogic({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (_, prefs) {
        if (prefs.hasData) {
          if (prefs.data.getString(kLoginId) != null) {
            return DogsBuyMeetSlider();
          } else {
            return WelcomePage();
          }
        }
        return Material(child: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
