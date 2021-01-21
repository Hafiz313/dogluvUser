import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/custom_switch.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dogluv_user_app/views/pages/package_leader_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchFormPage extends StatefulWidget {
  final String name;
  static const id = "search_form_page";
  const SearchFormPage({Key key, this.name}) : super(key: key);
  @override
  _SearchFormPageState createState() => _SearchFormPageState();
}
class _SearchFormPageState extends State<SearchFormPage> {




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
                      child: Text(kSearch,
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
                      ))),
              Container(
                  margin: EdgeInsets.only(top: AppSizes.appVerticalLg * .6),
                  padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5,
                      vertical: AppSizes.appVerticalLg * 0.5),
                  child: Column(
                    children: [
                      Form(
                        key: _notifier.searchFormKey,
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: AppSizes.appVerticalLg * .2),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  kDistance,
                                  style: simpleText(
                                      fontSize: 15, color: kLightBlue),
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
                                value: _notifier.searchDistanceValue,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kLightBlue,
                                ),
                                iconSize: 24,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String data) {
                                  setState(() {
                                    _notifier.searchDistanceValue = data;
                                  });
                                },
                                items: _notifier.searchDistanceItems
                                    .map<DropdownMenuItem<String>>(
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
                                  kSex,
                                  style: simpleText(
                                      fontSize: 15, color: kLightBlue),
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
                                value: _notifier.searchSexValue,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kLightBlue,
                                ),
                                iconSize: 24,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String data) {
                                  setState(() {
                                    _notifier.searchSexValue = data;
                                  });
                                },
                                items: _notifier.searchSexItems
                                    .map<DropdownMenuItem<String>>(
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
                                  style: simpleText(
                                      fontSize: 15, color: kLightBlue),
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
                                value: _notifier.searchBreedValue,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kLightBlue,
                                ),
                                iconSize: 24,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String data) {
                                  setState(() {
                                    _notifier.searchBreedValue = data;
                                  });
                                },
                                items: _notifier.searchBreedItems
                                    .map<DropdownMenuItem<String>>(
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
                                  kAge,
                                  style: simpleText(
                                      fontSize: 15, color: kLightBlue),
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
                                value: _notifier.searchAgeValue,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: kLightBlue,
                                ),
                                iconSize: 24,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                onChanged: (String data) {
                                  setState(() {
                                    _notifier.searchAgeValue = data;
                                  });
                                },
                                items: _notifier.searchAgeItems
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: AppSizes.appVerticalLg * 0.4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage("images/star_pink.png"),
                                      width: AppSizes.appVerticalLg * 0.4,
                                    ),
                                    SizedBox(
                                      width: AppSizes.appHorizontalLg * 0.15,
                                    ),
                                    Text(
                                      kShowOnlyProSellers,
                                      style: simpleText(
                                          color: kPinkColor, fontSize: 18),
                                    )
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                               child: CustomSwitch(
                                 value: _notifier.isProSeller,
                                 onChanged: (bool val){
                                   setState(() {
                                     _notifier.isProSeller = val;
                                   });
                                 },
                               ),

                               /*   child:Switch(
                                    value: isSwitched,
                                    onChanged: (value){
                                      setState(() {
                                        isSwitched=value;
                                        print(isSwitched);
                                      });
                                    },
                                    activeTrackColor: kGrayColorBG,
                                    activeColor: kPinkColor,
                                    inactiveTrackColor:kGrayColorBG,
                                  ),*/
                                ),


                              ],
                            ),
                            SizedBox(
                              height: AppSizes.appVerticalLg * 0.5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: AssetImage("images/blue_hand_icon.png"),
                                      width: AppSizes.appVerticalLg * 0.4,
                                    ),
                                    SizedBox(
                                      width: AppSizes.appHorizontalLg * 0.15,
                                    ),
                                    Text(
                                      "$kAvailableForAdoption",
                                        overflow: TextOverflow.ellipsis,
                                      style: simpleText(
                                          color: kBgBlueSlider4, fontSize: 18),
                                    ),

                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: CustomSwitch(
                                    value: _notifier.isAvailableAdoption,
                                    color: kBgBlueSlider4,
                                    onChanged: (bool val){
                                      setState(() {
                                        _notifier.isAvailableAdoption = val;
                                      });
                                    },
                                  ),
                                ),



                              ],
                            ),
                            SizedBox(
                              height: AppSizes.appVerticalLg * 1,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.appHorizontalLg * 2.5,
                              ),
                              width: double.infinity,
                              child: _notifier.state == ViewState.kBusy
                                  ? SpinKitWave(
                                      color: kWhiteColor,
                                      size: AppSizes.appVerticalLg * 0.55,
                                    )
                                  : roundRectangleBtn(
                                      txt: kContinue,
                                      textColor: kLightBlue,
                                      bgColor: kWhiteColor,
                                      onPressed: () async {
                                        await _notifier.validateSearchForm();

                                        if (_notifier.isSearchForm) {
                                          Fluttertoast.showToast(
                                            msg: "${_notifier.authMsg}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                          );
                                        } else {
                                          print("----------------not ok------------------");
                                          Fluttertoast.showToast(
                                            msg: "${_notifier.authMsg}",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                          );
                                        }
                                      }),
                            ),
                            SizedBox(
                              height: AppSizes.appVerticalLg * 0.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }


}
