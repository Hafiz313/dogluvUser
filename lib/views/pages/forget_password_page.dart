import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';



class ForgetPasswordPage extends StatefulWidget {
  static const id="forget_password_page";
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: Container(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                    margin: EdgeInsets.only(top:AppSizes.appVerticalLg * 0.4 ),
                    child: Text(kForgetPassword,style:boldText(fontSize: 20,color: kWhiteColor)))),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(right: AppSizes.appVerticalLg * 0.4,top:AppSizes.appVerticalLg * 0.4),
                child: InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(FontAwesomeIcons.times,color: kWhiteColor,size: 20,)),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(
                  bottom: AppSizes.appVerticalLg * 0.5
                ),
                padding: EdgeInsets.symmetric(horizontal:AppSizes.appHorizontalLg * 2),
                child: _notifier.state == ViewState.kBusy
                    ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,):  roundRectangleBtn(txt: kSend,textColor: kLightBlue,bgColor:kWhiteColor,
                    onPressed: () async {
                      await _notifier.validateAndSubmitForgetEmail();

                      if(_notifier.isForgetPassword){
                        Navigator.pushNamed(context, SignInPage.id);

                        Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                        );
                      }
                      else
                        print("----------------not ok------------------");
                      Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                      );
                    }
                ),
              ),
            ),
               Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.5,
                vertical: AppSizes.appVerticalLg * 0.5
              ),

              child: Form(
              key: _notifier.forgetFormKey,
                child: Column(children: [
                  Container(
                    margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 1),
                      alignment: Alignment.topLeft,
                      child: Text(kEmail,style: simpleText(fontSize: 15,color:kLightBlue),)),
                  SizedBox(height: AppSizes.appVerticalLg *.2,),
                  simpleTxtField(
                    labelTxt: kEmail,
                    keyboardType: TextInputType.emailAddress,
                     onsaved: (value) => _notifier.forgetPasswordEmail = value,
                    validator: (value) => value.isEmpty ? "$kEmail $kCanNempty"
                        : validateEmail(value) != true
                        ? "$kEmail is not valid"
                        : null,
                  ),
                ],),



              ),
            ),

          ],
        ),
      ),
    );
  }
}

