import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SendRequestFormPage extends StatefulWidget {
  final String name;
  static const id = "send_request_form_page";

  const SendRequestFormPage({Key key, this.name}) : super(key: key);
  @override
  _SendRequestFormPageState createState() => _SendRequestFormPageState();
}

class _SendRequestFormPageState extends State<SendRequestFormPage> {
  AdoptionOrSale selector = AdoptionOrSale.adoption;
  bool isOtherRadio= false;
  bool valuefirst = false;


  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(
                        top: AppSizes.appVerticalLg * 0.3,
                      ),
                      child: Text(kSendRequest,
                          style: boldText(fontSize: 20, color: kWhiteColor)))),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: EdgeInsets.only(
                        right: AppSizes.appVerticalLg * 0.4,
                        top: AppSizes.appVerticalLg * 0.32,
                      ),
                      child: Icon(
                        FontAwesomeIcons.times,
                        color: kWhiteColor,
                        size: 20,
                      )
                  )
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.appVerticalLg * 0.4,
                        top: AppSizes.appVerticalLg * 0.32,
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: kWhiteColor,
                        size: 20,
                      )
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * .6),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.5,
                    vertical: AppSizes.appVerticalLg * 0.5),
                child:Form(
                    key: _notifier.sendRequestMainFormKey,
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          kChildren_with_age,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        Row(

                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: AppSizes.appVerticalLg * .1,),
                                  Text(
                                    kNameOfChild,
                                    style:
                                    simpleText(fontSize: 15, color: kWhiteColor),
                                  ),
                                  SizedBox(height: AppSizes.appVerticalLg * .1,),
                                  simpleTxtField(
                                    //  labelTxt: kEnterPrice,
                                    keyboardType: TextInputType.text
                                    ,
                                    onsaved: (value) => _notifier.sendRequestNameChild = value,
                                    validator: (value) => value.isEmpty
                                        ? " $kNameOfChild empty!"
                                        : null,
                                  ),
                                ],),
                            ),
                            SizedBox(width: AppSizes.appHorizontalLg * 0.4,),
                            Expanded(
                              flex: 1,
                              child:Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: AppSizes.appVerticalLg * .1,),
                                  Text(
                                    kAge,
                                    style:
                                    simpleText(fontSize: 15, color: kWhiteColor),
                                  ),
                                  SizedBox(height: AppSizes.appVerticalLg * .1,),
                                  simpleTxtField(
                                    // labelTxt: kEnterPrice,
                                    keyboardType: TextInputType.number,
                                    onsaved: (value) => _notifier.sendRequestAge = value,
                                    validator: (value) => value.isEmpty
                                        ? " $kAge empty!"
                                        : null,
                                  ),
                                ],),
                            ),
                          ],
                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.5,),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 2.5,
                          ),
                          width: double.infinity,
                          child: roundRectangleBtn(txt: kADD_CHILD,textColor: kLightBlue,bgColor:kWhiteColor,
                              onPressed: () {
                                  print("-----------------hdkasf-----------------");

                              }
                          ),
                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.5,),

                      Text(
                        kListAnyAdditional,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .2,),
                      simpleTxtField(
                        keyboardType: TextInputType.text,
                        onsaved: (value) => _notifier.sendRequestAdditionalPeople = value,
                        validator: (value) => value.isEmpty
                            ? " $kListAnyAdditional empty!"
                            : null,
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .2,),
                      Text(
                        kWhoResponsible,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .2,),
                      simpleTxtField(

                        keyboardType: TextInputType.text,
                        onsaved: (value) => _notifier.sendRequestDogsCare = value,
                        validator: (value) => value.isEmpty
                            ? " $kWhoResponsible empty!"
                            : null,
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .2,),
                      Text(
                        khouseholdExperiencedAllergies,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,
                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kYes",
                              groupValue: _notifier.isHouseHoldAllergies ,
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isHouseHoldAllergies = newValue),
                            ),
                            _myRadioButton(
                              title: "$kNo",
                              groupValue: _notifier.isHouseHoldAllergies ,
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isHouseHoldAllergies = newValue),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        kFor10_15_years,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,
                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kYes",
                              groupValue: _notifier.isSendRequestDogsYear ,
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestDogsYear = newValue),
                            ),
                            _myRadioButton(
                              title: "$kNo",
                              groupValue: _notifier.isSendRequestDogsYear ,
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestDogsYear = newValue),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        kEventUnderCare,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      simpleTxtField(
                        keyboardType: TextInputType.text,
                        onsaved: (value) => _notifier.sendRequestUnableCare = value,
                        validator: (value) => value.isEmpty
                            ? "Empty!"
                            : null,
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .1,),
                      Text(
                        kLookingToAdopt,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,

                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kCompanionSpouse",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value: 0,
                                onChanged: (newValue) {
                                  setState(() {
                                    _notifier.isSendRequestAdoptDogs = newValue;
                                    isOtherRadio= false;
                                  });
                                }
                            ),
                            _myRadioButton(
                              title: "$kCompanionChildren",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value: 1,
                                onChanged: (newValue) {
                                  setState(() {
                                    _notifier.isSendRequestAdoptDogs = newValue;
                                    isOtherRadio= false;
                                  });
                                }
                            ),
                            _myRadioButton(
                              title: "$kCompanionPet",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value: 2,
                                onChanged: (newValue) {
                                  setState(() {
                                    _notifier.isSendRequestAdoptDogs = newValue;
                                    isOtherRadio= false;
                                  });
                                }
                            ),
                            _myRadioButton(
                              title: "$kReplaceDeceased",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value:3,
                                onChanged: (newValue) {
                                  setState(() {
                                    _notifier.isSendRequestAdoptDogs = newValue;
                                    isOtherRadio= false;
                                  });
                                }
                            ),
                            _myRadioButton(
                              title: "$kGiftFor",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value: 4,
                                onChanged: (newValue) {
                                  setState(() {
                                    _notifier.isSendRequestAdoptDogs = newValue;
                                    isOtherRadio= false;
                                  });
                                }
                            ),
                            _myRadioButton(
                              title: "$kOtherPleaseExplain",
                              groupValue: _notifier.isSendRequestAdoptDogs ,
                              value: 5,
                              onChanged: (newValue) {
                                setState(() {
                                  _notifier.isSendRequestAdoptDogs = newValue;
                                  isOtherRadio= true;
                                });
                              }
                            ),
                            Container(
                              child: isOtherRadio ?simpleTxtField(
                                keyboardType: TextInputType.text,
                                onsaved: (value) => _notifier.sendRequestAdoptDogsOther = value,
                                validator: (value) => value.isEmpty
                                    ? isOtherRadio ?"Empty!":null : null,
                              ):null,
                            )

                          ],
                        ),
                      ),
                        SizedBox(height: AppSizes.appVerticalLg * .2,),
                      Text(
                        kOwnYourHome,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,
                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kOwn",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),
                            _myRadioButton(
                              title: "$kRent",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        kAnyFollowing,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,
                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kDogDoor",
                              groupValue: _notifier.isSendRequestFollowingDogs ,
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestFollowingDogs = newValue),
                            ),
                            _myRadioButton(
                              title: "$kPatio",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),
                            _myRadioButton(
                              title: "$kBalcony",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 2,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),
                            _myRadioButton(
                              title: "$kGarden",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 3,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),
                            _myRadioButton(
                              title: "$kSwimmingPool",
                              groupValue: _notifier.isSendRequestOwnRent ,
                              value: 4,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestOwnRent = newValue),
                            ),

                          ],
                        ),
                      ),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            kHaveFence,
                            style:
                            simpleText(fontSize: 15, color: kLightBlue),
                          )),
                      Theme(
                        data: Theme.of(context).copyWith(
                            unselectedWidgetColor: kWhiteColor,
                            disabledColor: kLightBlue),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            _myRadioButton(
                              title: "$kYes",
                              groupValue: _notifier.isSendRequestHaveFence ,
                              value: 0,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestHaveFence = newValue),
                            ),
                            _myRadioButton(
                              title: "$kNo",
                              groupValue: _notifier.isSendRequestHaveFence ,
                              value: 1,
                              onChanged: (newValue) =>
                                  setState(() => _notifier.isSendRequestHaveFence = newValue),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        kDogSleepNight,
                        style:
                        simpleText(fontSize: 15, color: kLightBlue),
                      ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        simpleTxtField(
                          keyboardType: TextInputType.text,
                          onsaved: (value) => _notifier.sendRequestSleepNight = value,
                          validator: (value) => value.isEmpty
                              ? "Empty!"
                              : null,
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        Text(
                          kHoursLeftAlone,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        simpleTxtField(
                          keyboardType: TextInputType.text,
                          onsaved: (value) => _notifier.sendRequestHourLeftAlone = value,
                          validator: (value) => value.isEmpty
                              ? "Empty!"
                              : null,
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        Text(
                          kLeftAlone,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        simpleTxtField(
                          keyboardType: TextInputType.text,
                          onsaved: (value) => _notifier.sendRequestLeftAlone = value,
                          validator: (value) => value.isEmpty
                              ? "Empty!"
                              : null,
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        Text(
                          kDogExercised,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        simpleTxtField(
                          keyboardType: TextInputType.text,
                          onsaved: (value) => _notifier.sendRequestDosExercised = value,
                          validator: (value) => value.isEmpty
                              ? "Empty!"
                              : null,
                        ),
                        SizedBox(height: AppSizes.appVerticalLg *0.2,),
                        Text(
                          kFirstPet,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: kWhiteColor,
                              disabledColor: kLightBlue),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _myRadioButton(
                                title: "$kYes",
                                groupValue: _notifier.isSendRequestFirstPet ,
                                value: 0,
                                onChanged: (newValue) =>
                                    setState(() => _notifier.isSendRequestFirstPet = newValue),
                              ),
                              _myRadioButton(
                                title: "$kNo",
                                groupValue: _notifier.isSendRequestFirstPet ,
                                value: 1,
                                onChanged: (newValue) =>
                                    setState(() => _notifier.isSendRequestFirstPet = newValue),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          kOtherPets,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        ),
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: kWhiteColor,
                              disabledColor: kLightBlue),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              _myRadioButton(
                                title: "$kYes",
                                groupValue: _notifier.isSendRequestOtherPet ,
                                value: 0,
                                onChanged: (newValue) =>
                                    setState(() => _notifier.isSendRequestOtherPet = newValue),
                              ),
                              _myRadioButton(
                                title: "$kNo",
                                groupValue: _notifier.isSendRequestOtherPet ,
                                value: 1,
                                onChanged: (newValue) =>
                                    setState(() => _notifier.isSendRequestOtherPet = newValue),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
                              child: Checkbox(
                                checkColor: kLightBlue,
                                activeColor: kCheckBoxBgColor,
                                value: this.valuefirst,
                                onChanged: (bool value) {
                                  setState(() {
                                    this.valuefirst = value;
                                  });
                                },
                              ),
                            ),
                            Container(
                                transform: Matrix4.translationValues(-20.0, 0.0, 0.0),

                                child: Text("$kIAgreeWith",style: simpleText(color: kGrayText,fontSize: 14),)),
                            Container(
                                transform: Matrix4.translationValues(-20.0, 0.0, 0.0),

                                child: Text(" $kTermsAndConditions",style: boldText(color: kWhiteColor,fontSize: 15),)),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 2.5,
                          ),
                          width: double.infinity,
                          child:_notifier.state == ViewState.kBusy
                              ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,): roundRectangleBtn(txt: kSEND_REQUEST,textColor: kLightBlue,bgColor:kWhiteColor,
                              onPressed: () async{
                                await  _notifier.validateOfferForm();

                                if(_notifier.isSellServicesForm){
                                  // Navigator.pushNamed(context, PostPage.id);
                                  Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                                }
                                else{
                                  print("----------------not ok------------------");
                                  Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                                  );
                                }
                              }
                          ),
                        ),




                    ],)
                )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged,int groupValue}) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return Container(
      transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Container(
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: Text(
            title,
            style: simpleText(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
