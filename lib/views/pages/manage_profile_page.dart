import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
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
class ManageProfilePage extends StatefulWidget {

  static const id = "manage_profile_page";

  @override
  _ManageProfilePageState createState() => _ManageProfilePageState();
}

class _ManageProfilePageState extends State<ManageProfilePage> {
//  AdoptionOrSale selector = AdoptionOrSale.adoption;
  PhysicalOrWebstore selector = PhysicalOrWebstore.physical;


  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [

            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: AppSizes.appVerticalLg * .3),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.5,
                    vertical: AppSizes.appVerticalLg * 0.5),
                child:Column(
                  children: [


                    Form(
                      key: _notifier.manageProfileFormKey,
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kFirstName,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterFirstName,
                            keyboardType: TextInputType.text,
                            onsaved: (value) => _notifier.firstNameManageProfile = value,
                            validator: (value) => value.isEmpty
                                ? " $kFirstName empty!"
                                : null,
                          ),


                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                kEmail,
                                style:
                                simpleText(fontSize: 15, color: kLightBlue),
                              )),
                          simpleTxtField(
                            labelTxt: kEnterEmail,
                            keyboardType: TextInputType.text,
                            onsaved: (value) => _notifier.emailManageProfile = value,
                            validator: (value) => value.isEmpty ? "$kEmail $kCanNempty"
                                : validateEmail(value) != true
                                ? "$kEmail is not valid"
                                : null,
                          ),
                          SizedBox(height: AppSizes.appVerticalLg * 0.6,),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: AppSizes.appVerticalLg * .2),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(
                                          kQuestionnaire,
                                          style:
                                          simpleText(fontSize: 15, color: kLightBlue),
                                        ),
                                          SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                                        Text(
                                          kChangePasswordText,
                                          style:
                                          simpleText(fontSize: 15, color: kGrayText),
                                          textAlign: TextAlign.start,
                                        ),

                                      ],),
                                    ),
                                      SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                                    Expanded(child:roundRectangleBtn(txt: kRESET,isPadding: false,bgColor: kWhiteColor,textColor:kLightBlue ))



                                  ],),
                                  SizedBox(height: AppSizes.appVerticalLg * 0.8,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              kQuestionnaire,
                                              style:
                                              simpleText(fontSize: 15, color: kLightBlue),
                                            ),
                                            SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                                            Text(
                                              kLoremIpsum,
                                              style:
                                              simpleText(fontSize: 15, color: kGrayText),
                                              textAlign: TextAlign.start,
                                            ),

                                          ],),
                                      ),
                                      SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                                      Expanded(child:roundRectangleBtn(txt: kEDIT,isPadding: false,bgColor: kWhiteColor,textColor:kLightBlue ))



                                    ],),

                                ],
                              )),
                          SizedBox(height: AppSizes.appVerticalLg * 0.5,),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 2.5,
                            ),
                            width: double.infinity,
                            child:_notifier.state == ViewState.kBusy
                                ? SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,): roundRectangleBtn(txt:
                                kSAVE,textColor: kLightBlue,bgColor:kWhiteColor,
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
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  color: kGrayColorBG,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            left: AppSizes.appVerticalLg * 0.4,
                            top: AppSizes.appVerticalLg * 0.32,
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: kWhiteColor,
                              size: 20,
                            ),
                          )
                      ),
                      Container(
                          color: kGrayColorBG,
                          padding: EdgeInsets.only(
                            top: AppSizes.appVerticalLg * 0.3,
                          ),
                          child: Text(kManageProfile,
                              style: boldText(fontSize: 20, color: kWhiteColor))),
                      Container(
                          margin: EdgeInsets.only(
                            right: AppSizes.appVerticalLg * 0.4,
                            top: AppSizes.appVerticalLg * 0.32,
                          ),
                          child: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: kGrayColorBG,
                            size: 20,
                          )
                      ),
                    ],
                  ),
                )
            ),
        /*    Align(
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
            ),*/
            Align(alignment: Alignment.bottomCenter,
              child: Container(
                  height: AppSizes.appVerticalLg * 1,
                  color: kWhiteColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("images/delete_icon.png"),width: AppSizes.appHorizontalLg * 0.4,),
                      SizedBox(width: AppSizes.appVerticalLg * 0.1,),
                      Text(kDELETE_ACCOUNT,style: simpleText(color: kRedColor),)
                    ],)
              ),
            ),
          ],
        ),
      ),
    );
  }

}
