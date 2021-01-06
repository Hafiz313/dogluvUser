import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OfferFormPage extends StatefulWidget {
  final String name;
  static const id = "offer_form_page";

  const OfferFormPage({Key key, this.name}) : super(key: key);
  @override
  _OfferFormPageState createState() => _OfferFormPageState();
}

class _OfferFormPageState extends State<OfferFormPage> {
  AdoptionOrSale selector = AdoptionOrSale.adoption;
  // ignore: missing_return
  Future<void> setGender(){

    setState(() {
      selector = AdoptionOrSale.sale;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ignore: unnecessary_statements
    if(widget.name== kSell)
    setGender();
  }
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
                      child: Text(kOffer,
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
              Container(
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * .6),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.5,
                    vertical: AppSizes.appVerticalLg * 0.5),
                child:Column(
                  children: [
                    Text(
                      kChooseYourOffer,
                      style: simpleText(color: kBlueColor, fontSize: 18),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.appVerticalLg * 0.1),
                      margin:
                      EdgeInsets.only(top: AppSizes.appVerticalLg * 0.2),
                      width: AppSizes.appVerticalLg * 6,
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  left: AppSizes.appVerticalLg * 0.1,
                                ),
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.appHorizontalLg * 0.3),
                                    ),
                                    color: selector == AdoptionOrSale.adoption
                                        ? kBlueColor
                                        : Colors.white,
                                    //  textColor:Colors.black,
                                    textColor:  selector == AdoptionOrSale.adoption
                                        ? Colors.white
                                        : kBlackColor,
                                    onPressed: () {
                                      setState(() {
                                        selector = AdoptionOrSale.adoption;
                                        print("-----------$selector-----------");
                                        _notifier.strAdoptionOrSale= "Adoption";
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: selector == AdoptionOrSale.adoption
                                              ? AssetImage(
                                              "images/adoption_icon.png")
                                              : AssetImage(
                                              "images/adoption_blue_icon.png"),
                                          width: AppSizes.appHorizontalLg * 0.6,
                                        ),
                                        SizedBox(
                                          width: AppSizes.appHorizontalLg * 0.2,
                                        ),
                                        Text(
                                          kFOR_ADOPTION,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )),
                              )),
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  right: AppSizes.appVerticalLg * 0.1,
                                ),
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.appHorizontalLg * 0.3),
                                    ),
                                    color: selector == AdoptionOrSale.sale
                                        ? kGreenBG
                                        : Colors.white,
                                    textColor: selector == AdoptionOrSale.sale
                                        ? Colors.white
                                        : kBlackColor,
                                    disabledTextColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        selector = AdoptionOrSale.sale;
                                        print("-----------$selector-----------");
                                        _notifier.strAdoptionOrSale= "Sale";
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image:selector == AdoptionOrSale.sale
                                              ? AssetImage("images/sale_icon.png")
                                              : AssetImage(
                                              "images/sale_icon_blue.png"),
                                          width: AppSizes.appHorizontalLg * 0.6,
                                        ),
                                        SizedBox(
                                          width: AppSizes.appHorizontalLg * 0.2,
                                        ),
                                        Text(
                                          kFOR_SALE,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    )),
                              )),
                        ],
                      ),
                    ),
                    Form(
                      key: _notifier.offerFormKey,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kSex,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.appVerticalLg * 0.1,
                                horizontal: AppSizes.appHorizontalLg * 0.3),
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
                            child: DropdownButton<String>(
                              dropdownColor: kBlueColor,
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _notifier.offerSexValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kLightBlue,
                              ),
                              iconSize: 24,
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                              onChanged: (String data) {
                                setState(() {
                                  _notifier. offerSexValue = data;
                                });
                              },
                              items:_notifier. offerSexItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kBreed,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.appVerticalLg * 0.1,
                                horizontal: AppSizes.appHorizontalLg * 0.3),
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
                            child: DropdownButton<String>(
                              dropdownColor: kBlueColor,
                              isExpanded: true,
                              underline: SizedBox(),
                              value: _notifier.offerBreedValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kLightBlue,
                              ),
                              iconSize: 24,
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                              onChanged: (String data) {
                                setState(() {
                                  _notifier. offerBreedValue = data;
                                });
                              },
                              items:_notifier. offerBreedItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kPrice,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterPrice,
                            keyboardType: TextInputType.number,
                            onsaved: (value) => _notifier.offerPrice = value,
                            validator: (value) => value.isEmpty
                                ? " $kPrice empty!"
                                : null,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kLocation,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.appVerticalLg * 0.3,
                                horizontal: AppSizes.appHorizontalLg * 0.3),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  kSelectLocation,
                                  style: simpleText(color: kWhiteColor),
                                ),
                                Image(
                                  image: AssetImage("images/location_icon.png"),
                                  width: AppSizes.appHorizontalLg * 0.4,
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kPurebredNonPurebred,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: kWhiteColor,
                                disabledColor: Colors.blue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _myRadioButton(
                                  groupValue: _notifier.purebredNonPurebredGroup,
                                  title: "$kPurebred",
                                  value: 0,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.purebredNonPurebredGroup = newValue),
                                ),
                                _myRadioButton(
                                  title: "$kNonPurebred",
                                  groupValue: _notifier.purebredNonPurebredGroup,
                                  value: 1,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.purebredNonPurebredGroup = newValue),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kAge,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.appVerticalLg * 0.1,
                                horizontal: AppSizes.appHorizontalLg * 0.3),
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
                            child: DropdownButton<String>(
                              dropdownColor: kBlueColor,
                              isExpanded: true,
                              underline: SizedBox(),
                              value:_notifier. offerAgeValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kLightBlue,
                              ),
                              iconSize: 24,
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                              onChanged: (String data) {
                                setState(() {
                                  _notifier.offerAgeValue = data;
                                });
                              },
                              items:_notifier. offerAgeItems.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kNumberOfPuppies,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterAnimals,
                            keyboardType: TextInputType.number,
                              onsaved: (value) => _notifier.offerNoOfAnimals = value,
                            validator: (value) => value.isEmpty
                                ? "$kEnterAnimals is Empty !"
                                : null,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kRegistrationNumber,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kAddRegistration,
                            keyboardType: TextInputType.number,
                            onsaved: (value) => _notifier.offerAddRegNo = value,
                            /*validator: (value) => value.isEmpty ? "$kEmail $kCanNempty"
                                : validateEmail(value) != true
                                ? "$kEmail is not valid"
                                : null,*/
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kIsThisYour,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: kWhiteColor,
                                disabledColor: Colors.blue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _myRadioButton(
                                  title: "$kYes",
                                  groupValue: _notifier.isThisYourGroup ,
                                  value: 0,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isThisYourGroup = newValue),
                                ),
                                _myRadioButton(
                                  title: "$kNo",
                                  groupValue: _notifier.isThisYourGroup ,
                                  value: 1,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isThisYourGroup = newValue),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kIsYourAnimal,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: kWhiteColor,
                                disabledColor: Colors.blue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _myRadioButton(
                                  title: "$kYes",
                                  groupValue:_notifier.isYourAnimalGroup ,
                                  value: 0,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isYourAnimalGroup = newValue),
                                ),
                                _myRadioButton(
                                  title: "$kNo",
                                  groupValue:_notifier.isYourAnimalGroup ,
                                  value: 1,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isYourAnimalGroup = newValue),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kIsMicrochipped,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: kWhiteColor,
                                disabledColor: Colors.blue),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                _myRadioButton(
                                  title: "$kYes",
                                  groupValue: _notifier.isMicroChippedGroup,
                                  value: 0,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isMicroChippedGroup = newValue),
                                ),
                                _myRadioButton(
                                  groupValue: _notifier.isMicroChippedGroup,
                                  title: "$kNo",
                                  value: 1,
                                  onChanged: (newValue) =>
                                      setState(() => _notifier.isMicroChippedGroup = newValue),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kCompanyRegistration,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterCompanyRegistration,
                            keyboardType: TextInputType.text,
                             onsaved: (value) => _notifier.offerCompanyReg = value,
                            validator: (value) => value.isEmpty ? "$kEnterCompanyRegistration is Empty !"
                                : null,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kTellDog,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          TextFormField(
                            maxLines: 3,
                            onSaved:  (value) => _notifier.offerAboutDog = value,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                labelText: kAddText,
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
                            child: roundRectangleBtn(txt: kPost,textColor: kLightBlue,bgColor:kWhiteColor,
                                onPressed: () async{
                                //  await  _notifier.validateOfferForm();

                                 Navigator.pushNamed(context, MyProfilePage.id);
                                }
                            ),
                          ),
                          SizedBox(height: AppSizes.appVerticalLg * 0.5,),

                        ],
                      ),
                    ),
                  ],
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
