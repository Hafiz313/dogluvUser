import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/bay_package.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/pages/package_leader_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
class SellServicesPage extends StatefulWidget {
  final String name;
  static const id = "sell_services_page";

  const SellServicesPage({Key key, this.name}) : super(key: key);
  @override
  _SellServicesPageState createState() => _SellServicesPageState();
}

class _SellServicesPageState extends State<SellServicesPage> {
//  AdoptionOrSale selector = AdoptionOrSale.adoption;
  PhysicalOrWebstore selector = PhysicalOrWebstore.physical;


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
                      child: Text(kSellServices,
                          style: boldText(fontSize: 20, color: kWhiteColor)))
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
                child:Column(
                  children: [

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
                                  minWidth: double.infinity,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.appHorizontalLg * 0.3),
                                    ),
                                    color: selector ==  PhysicalOrWebstore.physical
                                        ? kPinkStoreBG
                                        : Colors.white,
                                    //  textColor:Colors.black,
                                    textColor:  selector ==  PhysicalOrWebstore.physical
                                        ? Colors.white
                                        : kBlackColor,
                                    onPressed: () {
                                      setState(() {
                                        selector = PhysicalOrWebstore.physical;
                                        print("-----------$selector-----------");
                                        _notifier.strPhysicalOrWebsoter= "Physical Address";
                                      });
                                    },
                                    child: Text(
                                      kPHYSICAL_ADDRESS,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              )),
                          Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                  right: AppSizes.appVerticalLg * 0.1,
                                ),
                                child: FlatButton(
                                    minWidth: double.infinity,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.appHorizontalLg * 0.3),
                                    ),
                                    color: selector == PhysicalOrWebstore.webstore
                                        ? kYellowColor
                                        : Colors.white,
                                    textColor: selector ==PhysicalOrWebstore.webstore
                                        ? Colors.white
                                        : kBlackColor,
                                    disabledTextColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        selector =PhysicalOrWebstore.webstore;
                                        print("-----------$selector-----------");
                                        _notifier.strPhysicalOrWebsoter= "webstore";
                                      });
                                    },
                                    child: Text(
                                      kWEBSOTRE,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              )),
                        ],
                      ),
                    ),
                    Form(
                      key: _notifier.sellServicesFormKey,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kStoreName,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterStoreName,
                            keyboardType: TextInputType.text,
                            onsaved: (value) => _notifier.storeName = value,
                            validator: (value) => value.isEmpty
                                ? " $kStoreName empty!"
                                : null,
                          ),


                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kActivityChoice,
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
                              value: _notifier.sellServiceActivityValue,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: kLightBlue,
                              ),
                              iconSize: 24,
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                              onChanged: (String data) {
                                setState(() {
                                  _notifier. sellServiceActivityValue = data;
                                });
                              },
                              items:_notifier. sellServicesActivityItems.map<DropdownMenuItem<String>>(
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
                                kAddress,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          TextFormField(
                            maxLines: 3,
                            onSaved:  (value) => _notifier.sellServiceAddress = value,
                            validator: (value) => value.isEmpty
                                ? " $kAddress empty!"
                                : null,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                                labelText: kEnterAddress,
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
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kDiscountCode,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kAddDiscountCode,
                            keyboardType: TextInputType.number,
                            onsaved: (value) => _notifier.strDiscountCode = value,
                            validator: (value) => value.isEmpty
                                ? " $kDiscountCode empty!"
                                : null,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kTellUsMoreAboutYourServices,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          TextFormField(
                            maxLines: 3,
                            onSaved:  (value) => _notifier.tellUsServices = value,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                            validator: (value) => value.isEmpty
                                ? " $kTellUsMoreAboutYourServices empty!"
                                : null,
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
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kAddPhoto,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppSizes.appVerticalLg * 0.1,
                                horizontal: AppSizes.appHorizontalLg * 0.2),
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
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                              Text(kSelectPhoto, style: simpleText(color: kWhiteColor,fontSize: 15),),
                              rectangleBtn(bgColor: kWhiteColor,txt:kBROWSER,fontSizeValue: 13,onPressed: () async {

                                _notifier.sellServicesImageFile  = await ImagePicker.pickImage(source: ImageSource.gallery);
                                setState(() {
                                  print("--------------------${ _notifier.sellServicesImageFile}-----------------");
                                });
                              })

                            ],),
                          ),
                          SizedBox(height: AppSizes.appVerticalLg * 0.5,),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 2.5,
                            ),
                            width: double.infinity,
                            child:_notifier.state == ViewState.kBusy
                                ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,): roundRectangleBtn(txt: kPost,textColor: kLightBlue,bgColor:kWhiteColor,
                                fontSize: 15,
                                onPressed: () async{
                                  Navigator.pushNamed(context, PackageLeaderPage.id);
                                 /* await  _notifier.validateSellServicesPost();
                                  if(_notifier.isSellServicesForm){
                                  Navigator.pushNamed(context, PostViewPage.id);
                                    Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                                  }
                                  else{
                                    print("----------------not ok------------------");
                                    Fluttertoast.showToast(msg: "${_notifier.authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                                    );
                                  }*/

                               //  Navigator.pushNamed(context, MyProfilePage.id);
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
