import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/separator.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_detail.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_home.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/pick_leader_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/pages/report_view_page.dart';
import 'package:dogluv_user_app/views/pages/send_request_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';

class DogsBuyMeetHomePage extends StatefulWidget {
  static const id = "dogs_buy_meet_home_page";

  @override
  _DogsBuyMeetHomePageState createState() => _DogsBuyMeetHomePageState();
}

class _DogsBuyMeetHomePageState extends State<DogsBuyMeetHomePage> {
  BuyOrMeet selector = BuyOrMeet.meet;

  showReportAlertDialog(BuildContext context) {
     final _notifier = Provider.of<AuthViewModel>(context,listen: false);
    AlertDialog alert = AlertDialog(
      backgroundColor: Color(0x01000000),
      contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      content: Container(
        height: AppSizes.appVerticalLg * 8,
        width: double.infinity,
        decoration: BoxDecoration(
            color: kGrayColorBG, borderRadius: new BorderRadius.circular(20)),

        child: Stack(
          children: [
            Image(image: AssetImage("images/bg_gradient.png")),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                  margin: EdgeInsets.all(AppSizes.appVerticalLg * 0.2),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },

                      child: Image(image: AssetImage("images/cross_icon_white.png"),width: AppSizes.appVerticalLg * 0.3,))),),
            Align(
              alignment: Alignment(0, -2),
              child:Column(
                children: [
                SizedBox(height: AppSizes.appVerticalLg * 1.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("images/envolap_circle_icon.png"),
                      width: AppSizes.appVerticalLg * 1,
                    ),
                    SizedBox(
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Container(
                      width: AppSizes.appVerticalLg * 2,
                      height: AppSizes.appVerticalLg * 2,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kBlueColor, // red as border color
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                "images/profile_man.png",
                              ),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: AppSizes.appVerticalLg * 0.4,
                    ),
                    Image(
                      image: AssetImage("images/heart_circle_icon.png"),
                      width: AppSizes.appVerticalLg * 1,
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                Text("First Name",style: boldText(color: kWhiteColor),),
                SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                Container(
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kPinkColor
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("images/star_icon.png"),width: AppSizes.appVerticalLg * 0.6,),
                        Text("Pro Seller",style: simpleText(color: kWhiteColor),)
                      ],)
                ),
                SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text("$kMemberSince",style: simpleText(color: kGrayText,fontSize: 18),),
                  Text(" 20th Jan, 2017 ",style: boldText(color: kWhiteColor,fontSize: 18),),
                ],),
                SizedBox(height: AppSizes.appVerticalLg * 0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$kLastActivity",style: simpleText(color: kGrayText,fontSize: 18),),
                    Text("6.33 am",style: boldText(color: kWhiteColor,fontSize: 18),),
                  ],),
                SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppSizes.appVerticalLg *0.2),
                  padding: EdgeInsets.all( AppSizes.appVerticalLg *0.2),
                  decoration: BoxDecoration(
                      border: Border.all(
                       color:kGrayText
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(children: [
                    Image(image: AssetImage("images/map_mark.png"),width: AppSizes.appVerticalLg * 0.2,),
                    SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("$kLocation",style: boldText(color: kPostDialogCross,fontSize: 18),),
                        SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                        Text("4 rue du Bulloz, 74940 ANNECY",style: boldText(color: kWhiteColor,fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,

                        ),

                    ],)
                  ],),)
              ],)
            ),

          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // final _notifier = Provider.of<AuthViewModel>(context);
        return alert;
        // return Provider.value(value: _notifier, child: alert);;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/dog_bg.png"), fit: BoxFit.cover)),
      child: Container(
        padding: EdgeInsets.only(
          left: AppSizes.appHorizontalLg * 1,
          right: AppSizes.appHorizontalLg * 1,
          bottom: AppSizes.appHorizontalLg * 1,
        ),
        height: AppSizes.appVerticalLg * 3.5,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSizes.appVerticalLg * 9,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "$kTommy",
                    style: simpleText(color: kWhiteColor, fontSize: 22),
                  ),
                  SizedBox(
                    width: AppSizes.appVerticalLg * 0.1,
                  ),
                  Image(
                      width: AppSizes.appVerticalLg * 0.25,
                      image: AssetImage("images/venus.png")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            kPomerian,
                            style: simpleText(color: kGraySliderColor),
                          ),
                          Text(
                            r"$250",
                            style: boldText(color: kWhiteColor, fontSize: 20),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: AppSizes.appVerticalLg * 0.3),
                            child: Text(
                              kAge,
                              style: simpleText(color: kGraySliderColor),
                            ),
                          ),
                          Text(
                            "10",
                            style: simpleText(color: kWhiteColor, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.only(
                      top: AppSizes.appVerticalLg * 0.2,
                      left: AppSizes.appVerticalLg * 0.2,
                      right: AppSizes.appVerticalLg * 0.2,
                    ),
                    color: Colors.yellow,
                    height: AppSizes.appVerticalLg * 0.6,
                    width: 2.0,
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            kColor,
                            style: simpleText(color: kGraySliderColor),
                          ),
                          Text(
                            kBrown,
                            style: boldText(color: kWhiteColor, fontSize: 20),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kBgSlider2,
                            borderRadius: BorderRadius.circular(20)),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appVerticalLg * 0.2,
                            vertical: AppSizes.appHorizontalLg * 0.12),
                        child: InkWell(
                            onTap: () {
                              //  showAlertDialog(context);
                            },
                            child: Text(
                              kSale,
                              style: boldText(color: kWhiteColor, fontSize: 12),
                            )),
                      )
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * 0.2,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: AppSizes.appVerticalLg * 0.2,
                  horizontal: AppSizes.appHorizontalLg * 0.3,
                ),
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: AppSizes.appVerticalLg * 0.6,
                          height: AppSizes.appVerticalLg * 0.6,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/profile_man.png",
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        SizedBox(
                          width: AppSizes.appVerticalLg * .1,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Owner",
                              style: simpleText(color: kGrayText),
                            ),
                            Text(
                              "Jack Ryan",
                              style: simpleText(color: kWhiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showReportAlertDialog(context);
                        //  Navigator.pushNamed(context, SendRequestFormPage.id);
                      },
                      child: Image(
                          width: AppSizes.appHorizontalLg * 0.5,
                          height: AppSizes.appVerticalLg * 0.5,
                          image: AssetImage("images/envelope_icon.png")),
                    ),
                    Image(
                        width: AppSizes.appHorizontalLg * 0.5,
                        height: AppSizes.appVerticalLg * 0.5,
                        image: AssetImage("images/hard_icon_plus.png")),
                    Image(
                        width: AppSizes.appHorizontalLg * 0.3,
                        height: AppSizes.appVerticalLg * 0.3,
                        image: AssetImage("images/yellow_left_icon.png")),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes.appVerticalLg * .3,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                          child: Row(
                        children: [
                          Image(
                              width: AppSizes.appVerticalLg * 0.4,
                              height: AppSizes.appVerticalLg * 0.4,
                              image: AssetImage("images/map_mark.png")),
                          Expanded(
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  child: MySeparator(color: Colors.grey))),
                          Text(
                            "0.5 Kms",
                            style: boldText(color: kWhiteColor, fontSize: 18),
                          ),
                        ],
                      ))),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
              SizedBox(
                height: AppSizes.appVerticalLg * .2,
              ),
              Text(
                kText,
                style: simpleText(color: kGraySliderColor),
              ),
              SizedBox(
                height: AppSizes.appVerticalLg * .2,
              ),
              Row(
                children: [
                  Text(
                    "$kDISCOUNT_CODE :",
                    style: simpleText(color: kWhiteColor, fontSize: 18),
                  ),
                  Text(" gh6eryxc5", style: simpleText(color: kWhiteColor)),
                ],
              ),
              SizedBox(
                height: AppSizes.appVerticalLg * .1,
              ),
              Container(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GoogleMap(
                    tiltGesturesEnabled: false,
                    mapType: MapType.normal,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    onCameraMove: (CameraPosition cameraPosition) {
                      print(cameraPosition.zoom);
                    },
                    zoomControlsEnabled: false,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(31.510445, 74.344041), zoom: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
