import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/message_report_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class MessageViewPage extends StatefulWidget {
  static const id = "message_view_page";

  @override
  _MessageViewPageState createState() => _MessageViewPageState();
}

class _MessageViewPageState extends State<MessageViewPage> {

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
      backgroundColor:kPostBG,
      contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
      content:Container(
        padding: EdgeInsets.only(

          bottom: AppSizes.appHorizontalLg * 0.3,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 40,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: AppSizes.appVerticalLg * 0.2),

            child: Icon(FontAwesomeIcons.times,color: kPostDialogCross,),),
            Divider(thickness: 2,),
           Container(
             padding: EdgeInsets.symmetric(
               horizontal: AppSizes.appHorizontalLg * 0.3
             ),
             child: Column(children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisSize: MainAxisSize.max,
                 children: [
                   Container(
                     width: AppSizes.appVerticalLg * 0.8,
                     height: AppSizes.appVerticalLg * 0.8,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image: AssetImage(
                               "images/profile_lady.png",
                             ),
                             fit: BoxFit.fill)),
                   ),
                   SizedBox(
                     width: AppSizes.appVerticalLg * 0.3,
                   ),
                   Expanded(
                     child: Container(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,

                         children: [
                           Container(
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                               children: [
                                 Text(
                                   "Gertrude D. Liang ",
                                   style: boldText(
                                       color: kWhiteColor, fontSize: 13),
                                 ),
                                 Container(
                                   child: Text(
                                     "1 hour ago",
                                     style: boldText(
                                         color: kBlueColor, fontSize: 13),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Container(
                             child: Text(
                               kPostText,
                               maxLines: 2,
                               textAlign: TextAlign.start,
                               overflow: TextOverflow.ellipsis,
                               style: simpleText(color: kWhiteColor),
                             ),
                           ),

                         ],
                       ),
                     ),
                   ),
                 ],
               ),
               SizedBox(height: AppSizes.appVerticalLg * 0.7,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     width: AppSizes.appVerticalLg * 0.8,
                     height: AppSizes.appVerticalLg * 0.8,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         image: DecorationImage(
                             image: AssetImage(
                               "images/profile_man.png",
                             ),
                             fit: BoxFit.fill)),
                   ),
                   SizedBox(
                     width: AppSizes.appVerticalLg * 0.3,
                   ),
                   Expanded(child: TextFormField(

                     decoration: InputDecoration(
                       hintText: kYourReply,
                       hintStyle:
                       TextStyle(fontSize: 15.0, color: kPostDialogText),
                       border: InputBorder.none,
                     ),

                   ))

                 ],
               ),
               SizedBox(height: AppSizes.appVerticalLg * 2,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     child: Row(
                       children: [
                         Image(
                           image: AssetImage(
                             "images/image_icon.png",
                           ),
                           width: AppSizes.appVerticalLg * 0.4,
                         ),
                         SizedBox(
                           width: AppSizes.appHorizontalLg * 0.3,
                         ),
                         Image(
                             image: AssetImage("images/smile_icon.png"),
                             width: AppSizes.appVerticalLg * 0.4),
                       ],
                     ),
                   ),
                   Container(
                     child: roundRectangleBtn(
                         txt: kReply,
                         onPressed: null,
                         bgColor: kWhiteColor,
                         textColor: kBlackColor,
                         isPadding: false),
                   )
                 ],
               ),
             ],),
           )
          ],
        ),
      ),

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
    return BaseScaffold(
        backgroundImage: false,
        backgroudColor: kGrayColorBG,
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: AppSizes.appHorizontalLg * 0.5,
                      right: AppSizes.appHorizontalLg * 0.3,
                      bottom: AppSizes.appHorizontalLg * 0.5,
                      top: AppSizes.appHorizontalLg * 0.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: kWhiteColor,
                        ),
                        Text(kMessage,style: simpleText(color: kWhiteColor,fontSize: 20),),
                        Icon(
                          FontAwesomeIcons.ellipsisV,
                          color: kWhiteColor,
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: ListView.builder
                      (
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return  Container(
                           margin: EdgeInsets.symmetric(vertical: AppSizes.appVerticalLg * 0.3),
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appVerticalLg * 0.3
                            ),
                            child: Column(

                              children: [
                                Container(
                                  height: AppSizes.appVerticalLg * 0.8,
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: AppSizes.appVerticalLg * 0.8,
                                        height: AppSizes.appVerticalLg * 0.8,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "images/profile_man.png",
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: AppSizes.appVerticalLg * 0.2,
                                      ),
                                      Expanded(
                                        child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                     children: [
                                                       Text(
                                                         "Gertrude D. Liang ",
                                                         style: boldText(
                                                             color: kWhiteColor, fontSize: 13),
                                                       ),
                                                       Text(
                                                         "1 hour ago",
                                                         style: boldText(
                                                             color: kBlueColor, fontSize: 13),
                                                       ),
                                                     ],
                                                   ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.1),
                                  width: double.infinity,
                                  child: Text(
                                    kPostText,
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                    style: simpleText(color: kWhiteColor),
                                  ),
                                ),
                                SizedBox(
                                  height: AppSizes.appHorizontalLg * 0.3,
                                ),
                                Container(
                                  width: double.infinity,
                                    height: 200,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/post_img.png"),
                                    )),
                                SizedBox(
                                  height: AppSizes.appHorizontalLg * 0.3,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "745 $kLike",
                                      style: simpleText(
                                          color: kPostTextColor, fontSize: 10),
                                    ),
                                    SizedBox(
                                      width: AppSizes.appHorizontalLg * 0.1,
                                    ),
                                    Image(
                                        width: AppSizes.appHorizontalLg * 0.2,
                                        height: AppSizes.appVerticalLg * 0.2,
                                        image: AssetImage("images/gray_bar.png")),
                                    SizedBox(
                                      width: AppSizes.appHorizontalLg * 0.1,
                                    ),
                                    Text(
                                      "23 $kComments",
                                      style: simpleText(
                                          color: kPostTextColor, fontSize: 10),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSizes.appHorizontalLg * 0.3,
                                ),
                                Stack(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: AppSizes.appVerticalLg * 4.5,
                                        decoration: BoxDecoration(
                                            color: kPostBG,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                //Navigator.pushNamed(context, MessageViewPage.id);
                                              },
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(
                                                    vertical: AppSizes.appVerticalLg * 0.2
                                                ),
                                                child: Image(
                                                    width: AppSizes.appHorizontalLg * 0.4,
                                                    height: AppSizes.appVerticalLg * 0.4,
                                                    image:
                                                    AssetImage("images/hard_icon.png")),
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                            Image(
                                                width: AppSizes.appHorizontalLg * 0.4,
                                                height: AppSizes.appVerticalLg * 0.4,
                                                image: AssetImage("images/gray_bar.png")),
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                showAlertDialog(context);

                                              },
                                              child: Row(
                                                children: [
                                                  Image(
                                                      width: AppSizes.appHorizontalLg * 0.4,
                                                      height: AppSizes.appVerticalLg * 0.4,
                                                      image: AssetImage(
                                                          "images/msg_icon.png")),
                                                  SizedBox(
                                                    width: AppSizes.appHorizontalLg * .1,
                                                  ),
                                                  Text(
                                                    kComments,
                                                    style: boldText(
                                                        color: kWhiteColor, fontSize: 15),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                            Image(
                                                width: AppSizes.appHorizontalLg * 0.4,
                                                height: AppSizes.appVerticalLg * 0.4,
                                                image: AssetImage("images/gray_bar.png")),
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context, MessageReportPage.id);

                                              },
                                              child: Image(
                                                  width: AppSizes.appHorizontalLg * 0.4,
                                                  height: AppSizes.appVerticalLg * 0.4,
                                                  image: AssetImage(
                                                      "images/warrnig_icon.png")),
                                            ),
                                            SizedBox(
                                              width: AppSizes.appHorizontalLg * 0.3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          );
                        }
                    ),
                  )

                ],
              ),
            ),
            Align(alignment: Alignment.bottomRight,

            child:Container(
              margin: EdgeInsets.only(right: AppSizes.appVerticalLg * 0.3,
                bottom: AppSizes.appVerticalLg * 0.4,
              ),
              child: InkWell(
                  onTap: (){
                    showAlertDialog(context);

                  },

                  child: CircleButton(iconData:FontAwesomeIcons.bars,iconColor: kWhiteColor ,)),
            ),

              ),
          ],
        ));
  }
}
