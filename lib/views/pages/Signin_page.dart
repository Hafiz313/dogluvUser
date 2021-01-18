import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/forget_password_page.dart';
import 'package:dogluv_user_app/views/pages/intro_slider_page.dart';
import 'package:dogluv_user_app/views/pages/permissin_location_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignInPage extends StatefulWidget {
  static const id="sign_in_page";
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: AppSizes.appVerticalLg * 0.6
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: AppSizes.appVerticalLg *1.5,),
              Container(
                height: AppSizes.appVerticalLg * 3,
                width: AppSizes.appHorizontalLg * 6,
                child: Image(
                  image: AssetImage("images/logo.png"),
                ),
              ),
              SizedBox(height: AppSizes.appVerticalLg *.3,),
              Form(
                key: _notifier.signInForm,
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kEmail,style: simpleText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.1,),
                    simpleTxtField(
                      labelTxt: kEnterEmail,
                      keyboardType: TextInputType.text,
                      onsaved: (value) => _notifier.signInEmail = value,
                      validator: (value) => value.isEmpty ? "$kEmail $kCanNempty"
                          : validateEmail(value) != true
                          ? "$kEmail is not valid"
                          : null,
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kPassword,style: simpleText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.1,),
                    simpleTxtField(
                        ishidden: true,
                        labelTxt: kEnterPassword,
                        keyboardType: TextInputType.visiblePassword,
                        onsaved: (value) => _notifier.signInPassword = value,
                        validator: (value)=> value.isEmpty ? "$kPassword $kCanNempty" :
                        (value.length <4) ? "$kPassword must be 4 characters":
                        null
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),

                    Container(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ForgetPasswordPage.id);
                        },
                        child: Text(
                          "Forgot your password?",
                          style: boldText(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.6,),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.appHorizontalLg * 1
                      ),
                      width: double.infinity,
                      child: _notifier.state == ViewState.kBusy
                          ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,): roundRectangleBtn(txt: kSignIn,textColor: kBlueColorButton,bgColor: kLightBlue,onPressed: () async {

                        await _notifier.validateAndSubmitSignIn();
                        if(_notifier.isSignIn){
                          Navigator.pushNamed(context, IntroScreen.id);
                        //  Navigator.pushNamed(context, PermissionLocationPage.id);
                          Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                        }
                        else{
                          print("----------------not ok------------------");
                          Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                          );
                        }
                      }),
                    ),

                  ],
                ),

              ),
              SizedBox(height: AppSizes.appVerticalLg *0.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: simpleText(fontSize: 13, color: Colors.white,fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.popAndPushNamed(context, RegisterPage.id);
                    },
                    child: Text(
                      "$kRegister",
                      style: simpleText(color: kBlueColor, fontSize: 15,fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.appVerticalLg *2,),
            ],
          ),
        ),
      ),
    );
  }
}


