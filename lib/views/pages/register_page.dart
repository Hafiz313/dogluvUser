import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/permissin_location_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';



class RegisterPage extends StatefulWidget {
  static const id="register_page";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String strPasswordValue="";
  final TextEditingController cPassword = new TextEditingController();
  double kWeakValue =0, kStrongValue=1.0;
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    AppSizes().init(context);
    return BaseScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: AppSizes.appVerticalLg * .4,),
            Row(children: [
               Container(
                 padding: EdgeInsets.only(
                   left: AppSizes.appVerticalLg * 0.4
                 ),
                 child: Icon(FontAwesomeIcons.arrowLeft,color: kWhiteColor,size: 20,),
               ),
              Expanded(
                child: Center(
                  child: Container(
                    child:Text(kRegister,style:simpleText(fontSize: 22,color: kWhiteColor)),
                  ),
                ),
              ),
              Container(width:AppSizes.appVerticalLg * 0.4 ,)

            ],),
            SizedBox(height: AppSizes.appVerticalLg * .6,),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.6
              ),
              child: Form(
                key: _notifier.signUpFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kEmail,style: boldText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    simpleTxtField(
                      labelTxt: kEnterEmail,
                      keyboardType: TextInputType.emailAddress,
                     onsaved: (value) => _notifier.signUpEmail = value,
                      validator: (value) => value.isEmpty ? "$kEmail $kCanNempty"
                          : validateEmail(value) != true
                          ? "$kEmail is not valid"
                          : null,
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kPassword,style: boldText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),


                    /*simpleTxtField(
                        ishidden: true,
                        labelTxt: kEnterPassword,
                        keyboardType: TextInputType.visiblePassword,
                        onsaved: (value) => _notifier.signUpPassword = value,
                        validator: (value)=> value.isEmpty ? "$kPassword $kCanNempty" :
                        (value.length < 4) ? "$kPassword must be 4 characters": null
                    ),*/
                   TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  controller: cPassword,
                  onChanged: (String text) {
                    setState(() {
                      strPasswordValue = text;
                      print("---------------password lng :${strPasswordValue.length}--------------");
                      if(text.isEmpty ){
                        print("---------------isEmpty--------------");
                        kWeakValue =0; kStrongValue=1.0;
                      }
                       else if(text.length <=2 ){
                        print("---------------2--------------");
                        kWeakValue= 0.9;
                        kStrongValue =0.1;
                      }
                     else if (text.length <=4){
                        print("---------------4--------------");
                         kWeakValue= 0.8;
                       // kStrongValue =1.0;
                      }
                      else if (text.length <=6){
                        print("---------------6--------------");
                        kWeakValue= 0.5;
                      //  kStrongValue =0.0;
                      }
                      else if (text.length <8){
                        print("---------------6--------------");
                        kWeakValue= 0.0;
                        //  kStrongValue =0.0;
                      }
                      if(text.contains(new RegExp(r'[A-Z]', caseSensitive: false)) && text.contains( RegExp(r'^[a-zA-Z0-9]+$'))){

                        print("---------------variable--------------");
                      }
                  //    strPasswordValue.contains(new RegExp(r'[A-Z]', caseSensitive: false));
                    });

                  },
                  keyboardType: TextInputType.visiblePassword,
                  onSaved: (value) => _notifier.signUpPassword = value,
                  validator: (value)=> value.isEmpty ? "$kPassword $kCanNempty" :
                  (value.length < 5) ? "$kPassword must be 5 characters":
                 !(value.contains(new RegExp(r'[A-Z]', caseSensitive: false)) )? "Password must include letters":
                  /*!(value.contains(new RegExp(r'^[a-zA-Z0-9]+$')) ) ? "abcd ef":*/ null,
                  decoration: InputDecoration(
                      labelText: kEnterPassword,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:  BorderSide(color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white)),
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kPasswordStrength,style: boldText(fontSize: 15,color: Colors.white),)),
                    Text(kPasswordMust,style: simpleText(fontSize: 10,color: Colors.white),),
                    SizedBox(height: AppSizes.appVerticalLg *.1,),
                    Container(
                      width: double.infinity,
                     height: 5,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              stops: [
                                kWeakValue,
                                kStrongValue,

                              ],
                              colors: [kOrangeColorBar,kGreenBG]),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.1,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(kWEAK,style: simpleText(color: kOrangeColorBar),),
                          Text(kSTRONG,style: simpleText(color: kGreenBG),),


                        ],
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kConfirmPassword,style: boldText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    simpleTxtField(
                        ishidden: true,
                        labelTxt: kConfirmPassword,
                        keyboardType: TextInputType.visiblePassword,
                        onsaved: (value) => _notifier.signUpConformPassword = value,
                        validator: (value)=> value.isEmpty ? "$kPassword $kCanNempty" :
                        (value.length <4) ? "$kPassword must be 5 characters"
                            /*: value.toString() !=_notifier.signUpPassword.toString() ? "Password Not Match"*/
                        :null
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),


                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(kLanguagePreference,style: boldText(fontSize: 15,color: Colors.white),)),
                    SizedBox(height: AppSizes.appVerticalLg *.2,),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.appVerticalLg * 0.1,
                        horizontal: AppSizes.appHorizontalLg *0.3
                      ),
                     width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child:  DropdownButton<String>(

                        dropdownColor:kBlueColor,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _notifier.languageSelectValue,
                        icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                            _notifier.languageSelectValue = data;
                          });
                        },
                        items: _notifier.languageItemsArray.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg *.5,),


                  /*  Text('Selected Item = ' + '$dropdownValue',
                        style: TextStyle
                          (fontSize: 22,
                            color: Colors.black)),*/



                    Container(
                      width: double.infinity,

                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: AppSizes.appHorizontalLg * 1
                        ),
                        child: _notifier.state == ViewState.kBusy
                            ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,):roundRectangleBtn(txt: kRegister,textColor: kTextBlueColor,bgColor: Colors.white,
                          onPressed: () async {


                            await _notifier.validateAndSubmitSignUp();

                            if(_notifier.isSignUp){
                               Navigator.pushNamed(context, PermissionLocationPage.id);
                              Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);

                            }
                            else
                              print("----------------not ok------------------");
                            Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                            );
                          }

                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),
            SizedBox(height: AppSizes.appVerticalLg *.2,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  kAlreadyText,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                InkWell(
                  onTap: (){
                    Navigator.popAndPushNamed(context, SignInPage.id);
                  },
                  child: Text(
                    "$kSignIn",
                    style: TextStyle(color: kBlueColor, fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.appVerticalLg *.2,),
          ],
        ),
      ),

    );
  }
}




