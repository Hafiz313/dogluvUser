import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/separator.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:dogluv_user_app/views/pages/report_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



class MessageReportPage extends StatefulWidget {
  static const id="message_report_page";
  @override
  _MessageReportPageState createState() => _MessageReportPageState();
}

class _MessageReportPageState extends State<MessageReportPage> {


  // ignore: missing_return
  Future<void> getReportMessage(){
    print("--------------dasdf-----------------");
   // await _notifier.validateReportInappropriateMassagePost();

  }



  showAlertDialog(BuildContext context) {
   // final _notifier = Provider.of<AuthViewModel>(context,listen: false);



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
                  //  await Provider.of.validateReportInappropriateMassagePost();
                 //   await Provider.of<AuthViewModel>(context).validateReportInappropriateMassagePost();

                  // getReportMessage();
                   Navigator.pushNamed(context,ReportViewPage.id);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 0.6,
                        vertical: AppSizes.appVerticalLg * 0.1
                    ),
                    child: Row(
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
                Container(
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
                Divider(thickness: 1,),
                Container(
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
                Divider(thickness: 1,),
                Container(
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      this. showAlertDialog(context);
    });


  }


  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context,listen: false);
    return BaseScaffold(
      backgroundImage: false,
      body:  Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/dog_bg.png"),fit: BoxFit.cover
            )

        ),

        child: Align(

          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(
              left: AppSizes.appHorizontalLg * 1,
              right: AppSizes.appHorizontalLg * 1,
            ),
            height: AppSizes.appVerticalLg * 3.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("$kTommy",style: simpleText(color:kWhiteColor,fontSize: 22),),
                    SizedBox(width: AppSizes.appVerticalLg * 0.1,),
                    Image(
                        width: AppSizes.appVerticalLg * 0.25
                        ,
                        image:AssetImage("images/venus.png")),


                  ],
                ),
                Text(kPomerian,style:simpleText(color:kGraySliderColor) ,),


                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Container(
                        child: Row(children: [
                          Image(
                              width: AppSizes.appVerticalLg * 0.4,
                              height: AppSizes.appVerticalLg * 0.4,
                              image: AssetImage("images/map_mark.png")),
                          Expanded(child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0
                              ),
                              child: MySeparator(color: Colors.grey))),

                        ],),

                      )),
                      Expanded(child: Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            Text("0.5 Kms",style:boldText(color:kWhiteColor,fontSize: 18) ,),

                            Container(
                              margin:  EdgeInsets.only(
                                  top: AppSizes.appVerticalLg * 0.3
                              ),
                              child: InkWell(
                                  onTap: () async {
                                  //  await _notifier.validateReportInappropriateMassagePost();
                                 //   await _notifier.validateReportInappropriatePhotoPost();
                                //    await _notifier.validateReportInappropriateSpamPost();
                                    await _notifier.validateReportInappropriateOtherPost();
                                   // showAlertDialog(context);


                                  },

                                  child: CircleButton(iconData:FontAwesomeIcons.bars,iconColor: kWhiteColor ,)),
                            )
                          ],),

                      )),

                      /*Image(
                        width: AppSizes.appVerticalLg * 0.4,
                        height: AppSizes.appVerticalLg * 0.4,
                        image: AssetImage("images/map_mark.png")),
                    Text("0.5 Kms",style:boldText(color:kWhiteColor,fontSize: 18) ,),
                    SizedBox(width: AppSizes.appHorizontalLg * 1,),
                    Container(
                      margin:  EdgeInsets.only(
                          top: AppSizes.appVerticalLg * 0.3
                      ),
                      child: CircleButton(iconData:FontAwesomeIcons.bars,iconColor: kWhiteColor ,),
                    )*/
                    ],
                  ),
                ),

              ],

            ),

          ),
        ),


      ),
    );
  }
}


