

import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_page.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider.dart';
import 'package:dogluv_user_app/views/pages/profile_thanks_page.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';




class CreateProfileDogsFormPage extends StatefulWidget {
  static const id="create_profile_dogs_form_page";
  @override
  _CreateProfileDogsFormPageState createState() => _CreateProfileDogsFormPageState();
}


class _CreateProfileDogsFormPageState extends State<CreateProfileDogsFormPage> {

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () { Navigator.pushNamed(context, ProfileThanksPage.id);},
                child: Container(
                  padding: EdgeInsets.only(right: AppSizes.appVerticalLg * 0.4),
                  child: Icon(FontAwesomeIcons.times,color: kWhiteColor,size: 20,),
                ),
              ),
            ),
            Container(
              child:Center(child: Text(kCreateProfile,style:simpleText(fontSize: 18,color: kWhiteColor))),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.appHorizontalLg * 0.5,
                  vertical: AppSizes.appVerticalLg * 0.5
              ),

              child: Form(
                key: _notifier.createDogsProfileFormKey,
                child: Column(
                  children: [
                    Column(children: [
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: AppSizes.appVerticalLg *.2
                          ),
                          alignment: Alignment.centerLeft,
                          child: Text(kDogName,style: simpleText(fontSize: 15,color:kLightBlue),)),
                      simpleTxtField(
                        labelTxt: kEnterDogName,
                        keyboardType: TextInputType.text,
                        onsaved: (value) => _notifier.dogsNameProfile = value,
                        validator: (value) => value.isEmpty ? " Name $kCanNempty" : null,
                      ),

                    ],),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppSizes.appVerticalLg *.2
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(kAge,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                        value: _notifier.ageDogsValue,
                        icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                            _notifier.ageDogsValue = data;
                          });
                        },
                        items: _notifier.agesDogsItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppSizes.appVerticalLg *.2
                      ),
                        alignment: Alignment.centerLeft,
                        child: Text(kSex,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                        value: _notifier.dogsSexValue,
                        icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                            _notifier. dogsSexValue = data;
                          });
                        },
                        items: _notifier.dogSexItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppSizes.appVerticalLg *.2
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(kBreed,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                        value:_notifier. breedValue,
                        icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                            _notifier.breedValue = data;
                          });
                        },
                        items:_notifier.breedItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppSizes.appVerticalLg *.2
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(kLocalisation,style: simpleText(fontSize: 15,color:kLightBlue),)),
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
                        value: _notifier.localisationDogsValue,
                        icon: Icon(Icons.arrow_drop_down,color:kLightBlue,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                           _notifier. localisationDogsValue = data;
                          });
                        },
                        items: _notifier.localisationDogsItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppSizes.appVerticalLg *.2
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(kDescription,style: simpleText(fontSize: 15,color:kLightBlue),)),
                    TextFormField(
                      maxLines: 5,
                      onSaved:  (value) => _notifier.dogsDescriptionProfile = value,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          labelText: kEnterDescription,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:  BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.white)),
                          labelStyle: TextStyle(color: Colors.white,)),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.5,),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 2.5,
                      ),
                      width: double.infinity,
                      child: _notifier.state == ViewState.kBusy
                          ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,): roundRectangleBtn(txt: kContinue,textColor: kLightBlue,bgColor:kWhiteColor,
                      onPressed: () async {
                        await _notifier.validateAndSubmitDogsProfileFrom();
                        if(_notifier.isCreateDogsProfileForm){
                          Navigator.pushNamed(context, ProfileThanksPage.id);
                          Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);

                        }
                        else
                          print("----------------not ok------------------");
                        Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                        );
                      }
                      ),
                    ),



                  ],
                ),

              ),
            ),


          ],
        ),
      ),
    );

  }
}


