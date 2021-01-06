import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/utils/separator.dart';
import 'package:dogluv_user_app/views/pages/full_screen_dialog.dart';
import 'package:dogluv_user_app/views/pages/look_for_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DogsBuyMeetSliderOne extends StatefulWidget {
  @override
  _DogsBuyMeetSliderOneState createState() => _DogsBuyMeetSliderOneState();
}

class _DogsBuyMeetSliderOneState extends State<DogsBuyMeetSliderOne> {

  showAlertDialog(BuildContext context) {

    // ignore: non_constant_identifier_names
    Widget CancelButton = Container(

      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        color: kDialogColorBG,
        borderRadius:
        new BorderRadius.all(new Radius.circular(10.0)),
      ),
      width:1000,
      padding: EdgeInsets.all(10),
      child: Center(child: Text("Cancel",style: boldText(color: kTextBlueColor,))),

    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor:Color(0x01000000) ,
      contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
      content: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.rectangle,
            color: kDialogColorBG,
            borderRadius:
            new BorderRadius.all(new Radius.circular(10.0)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.appVerticalLg * 0.3
          ),

          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Container(

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
          Divider(thickness: 1,),
          Container(
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
          Container(
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

          Container(

            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
              color: kDialogColorBG,
              borderRadius:
              new BorderRadius.all(new Radius.circular(10.0)),
            ),
            width:1000,
            padding: EdgeInsets.all(10),
            child: Center(child: Text("Cancel",style: boldText(color: kTextBlueColor,))),

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


  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(kPomerian,style:simpleText(color:kGraySliderColor) ,),
                          Text(r"$250",style:boldText(color:kWhiteColor,fontSize: 20) ,),

                        ],
                      ),
                      Column(children: [
                        Padding(
                          padding:  EdgeInsets.only(
                              top: AppSizes.appVerticalLg * 0.3
                          ),
                          child: Text(kAge,style:simpleText(color:kGraySliderColor) ,),
                        ),
                        Text("10",style:simpleText(color:kWhiteColor,fontSize: 20) ,),



                      ],),
                    ],
                  )),
                  Container(
                    margin: EdgeInsets.only(top:  AppSizes.appVerticalLg * 0.2,
                      left:  AppSizes.appVerticalLg * 0.2,
                      right:  AppSizes.appVerticalLg * 0.2,),
                    color: Colors.yellow,
                    height: AppSizes.appVerticalLg * 0.6 ,
                    width: 2.0,
                  ),
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(kColor,style:simpleText(color:kGraySliderColor) ,),
                          Text(kBrown,style:boldText(color:kWhiteColor,fontSize: 20) ,),

                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: kBgSlider2,
                            borderRadius: BorderRadius.circular(20)
                        ),

                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appVerticalLg * 0.2,
                            vertical: AppSizes.appHorizontalLg * 0.12
                        ),

                        child: InkWell(
                            onTap: (){

                            },
                            child: Text(kSale,style: boldText(color: kWhiteColor,fontSize: 12),)),
                      )
                    ],
                  )),
                  /*Column(
                    children: [
                      Text(kPomerian,style:simpleText(color:kGraySliderColor) ,),
                      Text(r"$250",style:boldText(color:kWhiteColor,fontSize: 20) ,),

                    ],
                  ),
                  SizedBox(width: AppSizes.appVerticalLg * 0.7,),
                  Column(children: [
                    Padding(
                      padding:  EdgeInsets.only(
                          top: AppSizes.appVerticalLg * 0.3
                      ),
                      child: Text(kAge,style:simpleText(color:kGraySliderColor) ,),
                    ),
                    Text("10",style:simpleText(color:kWhiteColor,fontSize: 20) ,),



                  ],),
                  Container(
                    margin: EdgeInsets.only(top:  AppSizes.appVerticalLg * 0.2,
                      left:  AppSizes.appVerticalLg * 0.2,
                      right:  AppSizes.appVerticalLg * 0.2,),
                    color: Colors.yellow,
                    height: AppSizes.appVerticalLg * 0.6 ,
                    width: 2.0,
                  ),
                  Column(
                    children: [
                      Text(kColor,style:simpleText(color:kGraySliderColor) ,),
                      Text(kBrown,style:boldText(color:kWhiteColor,fontSize: 20) ,),

                    ],
                  ),
                  SizedBox(width: AppSizes.appVerticalLg * 0.3,),
                  Container(
                    decoration: BoxDecoration(
                        color: kBgSlider2,
                        borderRadius: BorderRadius.circular(20)
                    ),

                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.appVerticalLg * 0.2,
                        vertical: AppSizes.appHorizontalLg * 0.12
                    ),

                    child: InkWell(
                      onTap: (){
                        showAlertDialog(context);
                      },
                        child: Text(kSale,style: boldText(color: kWhiteColor,fontSize: 12),)),
                  ),*/
                ],
              ),
              SizedBox(height: AppSizes.appHorizontalLg * .07,),
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
                          onTap: (){
                            showAlertDialog(context);

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


    );
  }
}


