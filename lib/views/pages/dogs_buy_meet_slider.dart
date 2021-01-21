import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/swiper_configuration.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_home.dart';
import 'package:dogluv_user_app/views/pages/dogs_buy_meet_slider1.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_detail.dart';
import 'package:dogluv_user_app/views/pages/dogs_store_westore_home.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/match_dog_page.dart';
import 'package:dogluv_user_app/views/pages/pick_leader_page.dart';
import 'package:dogluv_user_app/views/pages/post_view_page.dart';
import 'package:dogluv_user_app/views/pages/report_view_page.dart';
import 'package:dogluv_user_app/views/pages/search_form_page.dart';
import 'package:dogluv_user_app/views/pages/sub_proflie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:fluttertoast/fluttertoast.dart';


class DogsBuyMeetSlider extends StatefulWidget {
  static const id="dogs_buy_meet_slider";
  @override
  _DogsBuyMeetSliderState createState() => new _DogsBuyMeetSliderState();
}
class _DogsBuyMeetSliderState extends State<DogsBuyMeetSlider> {

  showReportAlertDialog(BuildContext context) {
  final _notifier = Provider.of<AuthViewModel>(context,listen: false);
    AlertDialog alert = AlertDialog(
      backgroundColor:Color(0x01000000) ,
      contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
      content: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kDialogColorBG,
                  borderRadius:
                  new BorderRadius.all(new Radius.circular(10.0)),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.appVerticalLg * 0.3
                ),
                child: Column(
                  children: [
                    Text(kReport,style: boldText(color: kTextBlueColor),),
                    SizedBox(height:AppSizes.appVerticalLg * 0.3 ,),
                    InkWell(
                      onTap: () async {
                        showProcessBar(context);
                        await Provider.of<AuthViewModel>(context,listen: false).validateReportInappropriateMassagePost();
                     //   if(Provider.of<AuthViewModel>(context,listen: false).isReportMassage){
                          Fluttertoast.showToast(msg: "${Provider.of<AuthViewModel>(context,listen: false).authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,);
                          Navigator.pop(context);
                          Navigator.pushNamed(context,ReportViewPage.id);

                       // }


                      },
                      child:  Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child:Provider.of<AuthViewModel>(context,listen: false).state == ViewState.kBusy
                            ? SpinKitWave(color: Colors.blue,size: AppSizes.appVerticalLg *0.55,): Row(
                          children: [
                            Image(image:AssetImage("images/envelope.png"),
                              width: AppSizes.appVerticalLg * 0.3,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.15,),
                            Text(kInappropriateMessages,style: boldText(color: kGrayText,fontSize: 15),),


                          ],

                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () async {
                        await Provider.of<AuthViewModel>(context,listen: false).validateReportInappropriatePhotoPost();
                        Fluttertoast.showToast(msg: "${Provider.of<AuthViewModel>(context,listen: false).authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/photos_icon.png"),
                              width: AppSizes.appVerticalLg * 0.3,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.15,),
                            Text(kInappropriatePhotos,style: boldText(color: kGrayText,fontSize: 15),),


                          ],

                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () async {
                        await Provider.of<AuthViewModel>(context,listen: false).validateReportInappropriateSpamPost();
                        Fluttertoast.showToast(msg: "${Provider.of<AuthViewModel>(context,listen: false).authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/feels_icon.png"),
                              width: AppSizes.appVerticalLg * 0.3,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.15,),
                            Text(kFeelsLikeSpam,style: boldText(color: kGrayText,fontSize: 15),),


                          ],

                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () async {
                        showProcessBar(context);
                        await Provider.of<AuthViewModel>(context,listen: false).validateReportInappropriateOtherPost();
                        Fluttertoast.showToast(msg: "${Provider.of<AuthViewModel>(context,listen: false).authMsg}", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM,
                        );

                      },

                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/other_icon.png"),
                              width: AppSizes.appVerticalLg * 0.3,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.15,),
                            Text(kOther,style: boldText(color: kGrayText,fontSize: 15),),


                          ],

                        ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: AppSizes.appVerticalLg * .15,),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kDialogColorBG,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(10.0)),
                  ),
                  width:1000,
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text("Cancel",style: boldText(color: kBlueColor,))),

                ),
              )

            ],
          )),
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
  showProcessBar(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor:Color(0x01000000) ,
      contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
      content: Container(
        height: 50,
        child: SpinKitWave(color: kWhiteColor,size: AppSizes.appVerticalLg *0.55,),



    ));

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
  showProfileAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor:Color(0x01000000) ,
      contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
      content: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kDialogColorBG,
                  borderRadius:
                  new BorderRadius.all(new Radius.circular(10.0)),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.appVerticalLg * 0.3
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.pushNamed(context, MyProfilePage.id);
                      },
                      child: Container(

                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/user.png"),
                              width: AppSizes.appVerticalLg * 0.4,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                            Text(kProfile,style: boldText(color: kGrayText),),

                          ],

                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context,SearchFormPage.id );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/search.png"),
                              width: AppSizes.appVerticalLg * 0.4,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                            Text(kSearch,style: boldText(color: kGrayText),),

                          ],

                        ),
                      ),
                    ),
                    Divider(thickness: 1,),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.appHorizontalLg * 0.6,
                          vertical: AppSizes.appVerticalLg * 0.1
                      ),
                      child: Row(
                        children: [
                          Image(image:AssetImage("images/envelope.png"),
                            width: AppSizes.appVerticalLg * 0.4,
                          ),
                          SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                          Text(kMessage,style: boldText(color: kGrayText),),


                        ],

                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        showReportAlertDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child: Row(
                          children: [
                            Image(image:AssetImage("images/alert.png"),
                              width: AppSizes.appVerticalLg * 0.4,
                            ),
                            SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                            Text(kReportUser,style: boldText(color: kGrayText),),


                          ],

                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: AppSizes.appVerticalLg * .15,),
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kDialogColorBG,
                    borderRadius:
                    new BorderRadius.all(new Radius.circular(10.0)),
                  ),
                  width:1000,
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text("Cancel",style: boldText(color: kBlueColor,))),

                ),
              )

            ],
          )),
    );


    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  BuyOrMeet selector= BuyOrMeet.meet;
  bool isShowMenuBar= true;

  bool showLike=false;
  bool showUnlike=false;

  @override
  void initState() {
    // setState(() {
    //   steps = [
    //     _step0(),
    //     _step1(),
    //   ];
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
   final List<Widget> steps = [
     _step1()
   ];
   print("hi");



    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kWhiteColor,
      body: GestureDetector(
        onHorizontalDragUpdate: (details){
          print(details.primaryDelta);
          if(details.primaryDelta > 0.0 && details.primaryDelta <= 3.0)
            {
              //dislike
              setState(() {
                showUnlike=true;
                showLike=false;
              });

            }
          if(details.primaryDelta < 0.0 && details.primaryDelta >= -3.0)
            {
              //like
              setState(() {
                showLike=true;
                showUnlike=false;

              });

            }
        },
        onHorizontalDragEnd: (details){
          print("drag ended");
          print(details.primaryVelocity);
          print(details.velocity.pixelsPerSecond.distance);
          setState(() {
            showUnlike=false;
          });
          setState(() {
            showLike=false;
          });

          if(details.primaryVelocity > 0.0 )
          {
            //dislike
            setState(() {
              showUnlike=false;
            });

          }
          if(details.primaryVelocity < 0.0 )
          {
            //like
            setState(() {
              showLike=false;
            });

          }
        },
        child: Stack(children: [
          Swiper(
          itemBuilder: (BuildContext context, int index) {
            return steps[index];
          },
          loop: false,
            controller: SwiperController(),
          itemCount: steps.length,
          // pagination:SwiperPagination(margin: EdgeInsets.only(bottom: AppSizes.appVerticalLg * 3.5)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.45,
                  right: AppSizes.appVerticalLg * 0.2,
                ),
                child: InkWell(
                    onTap: (){
                     // showAlertDialog(context);
                      showProfileAlertDialog(context);
                    },
                    child: Icon(FontAwesomeIcons.ellipsisV,color: kWhiteColor,))),

          ),
          Align(
            alignment: Alignment.topCenter,

            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                padding: EdgeInsets.symmetric(
                    vertical:AppSizes.appVerticalLg * 0.1
                ),
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.4),


                width: AppSizes.appVerticalLg * 3,
                height: 40,
                child: Row(children: [
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: AppSizes.appVerticalLg *0.1,
                    ),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                        ),
                        color:selector==BuyOrMeet.buy ?kBlueColor : Colors.white,
                        //  textColor:Colors.black,
                        textColor: selector==BuyOrMeet.buy ? Colors.white : kBlackColor,
                        onPressed:(){
                          setState(() {
                            selector=BuyOrMeet.buy;
                            //  _notifier.signUpGender= "Male";
                          });

                        },
                        child: Text(kBUY,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                    ),
                  )),
                  Expanded(child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      right: AppSizes.appVerticalLg *0.1,

                    ),
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSizes.appHorizontalLg * 0.3),

                        ),
                        color:selector==BuyOrMeet.meet ? kBlueColor : Colors.white ,
                        textColor: selector==BuyOrMeet.meet ? Colors.white:kBlackColor,
                        disabledTextColor: Colors.white,

                        onPressed:(){
                          setState(() {
                            selector=BuyOrMeet.meet;
                            //  _notifier.signUpGender= "Male";
                          });

                        },
                        child: Text(kMEET,textAlign: TextAlign.center, style: TextStyle(fontSize: 12,),)
                    ),
                  )),





                ],),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  isShowMenuBar?Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: AppSizes.appHorizontalLg * 1,
                right: AppSizes.appHorizontalLg * 1,
                bottom: AppSizes.appHorizontalLg * 0.4,
              ),
              decoration: BoxDecoration(
                  color: kGrayBarBg,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: AppSizes.appHorizontalLg * 0.4,),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: AppSizes.appVerticalLg * 0.3
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, PostViewPage.id);
                      },
                      child: Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/home.png"
                          )),
                    ),
                  ),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  Image(
                      width: AppSizes.appHorizontalLg * 0.4,
                      height: AppSizes.appVerticalLg * 0.4,
                      image: AssetImage("images/gray_bar.png"
                      )),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, DogsStoreWebstoreDetail.id);
                    },
                    child: Image(
                        width: AppSizes.appHorizontalLg * 0.4,
                        height: AppSizes.appVerticalLg * 0.4,
                        image: AssetImage("images/hard_icon.png"
                        )),
                  ),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  Image(
                      width: AppSizes.appHorizontalLg * 0.4,
                      height: AppSizes.appVerticalLg * 0.4,
                      image: AssetImage("images/gray_bar.png"
                      )),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, DogsStoreWebstorePage.id);
                    },
                    child: Image(
                        width: AppSizes.appHorizontalLg * 0.4,
                        height: AppSizes.appVerticalLg * 0.4,
                        image: AssetImage("images/card_icon.png"
                        )),
                  ),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  Image(
                      width: AppSizes.appHorizontalLg * 0.4,
                      height: AppSizes.appVerticalLg * 0.4,
                      image: AssetImage("images/gray_bar.png"
                      )),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, LookForPage.id);
                    },
                    child: Image(
                        width: AppSizes.appHorizontalLg * 0.4,
                        height: AppSizes.appVerticalLg * 0.4,
                        image: AssetImage("images/add_circle.png"
                        )),
                  ),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  Image(
                      width: AppSizes.appHorizontalLg * 0.4,
                      height: AppSizes.appVerticalLg * 0.4,
                      image: AssetImage("images/gray_bar.png"
                      )),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, PickLeaderPage.id);
                    // Navigator.pushNamed(context, MatchDogsPage.id);
                    },
                    child: Image(
                        width: AppSizes.appHorizontalLg * 0.4,
                        height: AppSizes.appVerticalLg * 0.4,
                        image: AssetImage("images/king_icon.png"
                        )),
                  ),
                  SizedBox(width: AppSizes.appHorizontalLg * 0.3,),


                  InkWell(
                    onTap: (){
                      setState(() {
                        isShowMenuBar= false;
                        print("--------------adlfjla----------------");
                      });
                    },
                    child: Image(
                        width: AppSizes.appHorizontalLg * 0.3,
                        height: AppSizes.appVerticalLg * 0.3,
                        image: AssetImage("images/cross_icon.png"
                        )),
                  ),



                ],
              ),
            ): null,
          ),
          AnimatedOpacity(
            opacity: showLike ? 1 : 0,
            duration: Duration(milliseconds: 750),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 300,
                width: 150,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.green.withOpacity(0.4),
                        Colors.white.withOpacity(0.0),
                      ],


                      begin: const FractionalOffset(0.75, 0.0),
                      end: const FractionalOffset(0.0, 0.0),
                      stops: [0.0, 0.5],
                      tileMode: TileMode.clamp),
                  border: Border(
                    top: BorderSide(
                        color: Colors.transparent,
                        width: 1
                    ),
                    bottom: BorderSide(
                        color: Colors.transparent,
                        width: 1
                    ),
                    right: BorderSide(
                        color: Colors.transparent,
                        width: 1
                    ),
                    left: BorderSide(
                        color: Colors.transparent,
                        width: 1
                    ),
                  ),


                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(1500.0),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.favorite_border,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: showUnlike ? 1 : 0,
            duration: Duration(milliseconds: 750),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 300,
                width: 150,
                decoration: BoxDecoration(
                gradient: new LinearGradient(
                colors: [
                Colors.redAccent.withOpacity(0.4),
                Colors.white.withOpacity(0.0),
                ],

                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.6, 0.0),
                stops: [0.0, 2.0],
                tileMode: TileMode.clamp),
                  border: Border(
                    top: BorderSide(
                      color: Colors.transparent,
                      width: 1
                    ),
                    bottom: BorderSide(
                      color: Colors.transparent,
                      width: 1
                    ),
                    right: BorderSide(
                      color: Colors.transparent,
                      width: 1
                    ),
                    left: BorderSide(
                      color: Colors.transparent,
                      width: 1
                    ),
                  ),


                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(1500.0),
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.close,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

              ),
            ),
          ),


        ],),
      ),
    );
  }
  Widget _step0() {
    return DogsBuyMeetHomePage();
  }
  Widget _step1() {
    return DogsBuyMeetSliderOne();
  }

}


