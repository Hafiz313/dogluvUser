import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/shared_preferences.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CreateProfileFormPage extends StatefulWidget {
  static const id="create_profile_form_page";
  @override
  _CreateProfileFormPageState createState() => _CreateProfileFormPageState();
}

class _CreateProfileFormPageState extends State<CreateProfileFormPage> {

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return  SingleChildScrollView(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () { Navigator.pushNamed(context, SignInPage.id);},
              child: Container(
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.3,right: AppSizes.appHorizontalLg * 0.5),
                child: Icon(FontAwesomeIcons.times,color: kWhiteColor,size: 20,),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.3,),
              child: Text(kCreateProfile,style:simpleText(fontSize: 18,color: kWhiteColor)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.5),
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.appHorizontalLg * 0.5,
                vertical: AppSizes.appVerticalLg * 0.5
            ),
            child: Form(
              key: _notifier.createProfileForm,
              child:  Column(
                children: [
                  Container(
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(kName,style: simpleText(fontSize: 15,color:kLightBlue),)),
                      SizedBox(height: AppSizes.appVerticalLg *.2,),
                      simpleTxtField(
                        labelTxt: kEnterName,
                        keyboardType: TextInputType.emailAddress,
                        onsaved: (value) => _notifier.createProfileName = value,
                        validator: (value) => value.isEmpty ? "Name $kCanNempty" : null,
                      ),

                    ],),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg *.2,),
                  Container(
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(kAge,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                          value: _notifier.ageValue,
                          icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                          iconSize: 24,
                          style: TextStyle(color: Colors.white, fontSize: 16),

                          onChanged: (String data) {
                            setState(() {
                              _notifier.ageValue = data;
                            });
                          },
                          items: _notifier.agesItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),

                    ],),
                  ),
                  SizedBox(height: AppSizes.appVerticalLg *.2,),
                  Container(
                    child: Column(children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(kLocalisation,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                          value: _notifier.localisationValue,
                          icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                          iconSize: 24,
                          style: TextStyle(color: Colors.white, fontSize: 16),

                          onChanged: (String data) {
                            setState(() {
                              _notifier.localisationValue = data;
                            });
                          },
                          items: _notifier.localisationValueItems.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: AppSizes.appVerticalLg *3.5,),
                      Container(
                        margin: EdgeInsets.only(bottom: AppSizes.appVerticalLg * 0.2),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.appHorizontalLg * 2.5,
                        ),
                        width: double.infinity,
                        child: _notifier.state == ViewState.kBusy
                            ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,):  roundRectangleBtn(txt: kContinue,textColor: kLightBlue,bgColor:kWhiteColor,
                            onPressed: () async {
                              await _notifier.validateAndSubmitCreateProfileFrom();


                            }
                        ),
                      ),

                    ],),
                  ),
                ],
              ),

            ),
          ),

        ],
      ),
    );



  }
}


