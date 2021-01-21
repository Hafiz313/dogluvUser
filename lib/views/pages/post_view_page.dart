import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/message_report_page.dart';
import 'package:dogluv_user_app/views/pages/message_view_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class PostViewPage extends StatefulWidget {
  static const id = "post_view_page";

  @override
  _PostViewPageState createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundImage: false,
        backgroudColor: kGrayColorBG,
        body:
        Stack(
          children: [
            Align(alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.symmetric(
                    vertical: AppSizes.appVerticalLg * 0.3,
                    horizontal: AppSizes.appHorizontalLg * 0.5
                ),
                child: Container(


                  decoration: BoxDecoration(
                      color: kGrayBarBg,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/gray_bar.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/hard_icon.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/gray_bar.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/card_icon.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/gray_bar.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/add_circle.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/gray_bar.png"
                          )),


                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/king_icon.png"
                          )),

                      Image(
                          width: AppSizes.appHorizontalLg * 0.4,
                          height: AppSizes.appVerticalLg * 0.4,
                          image: AssetImage("images/cross_icon.png"
                          )),
                      SizedBox(width: AppSizes.appHorizontalLg * 0.4,),



                    ],
                  ),
                ),
              ),

            ),
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
                        Container(
                          width: AppSizes.appVerticalLg * 0.8,
                          height: AppSizes.appVerticalLg * 0.8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/profile_img.png",
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                        Icon(
                          FontAwesomeIcons.ellipsisV,
                          color: kWhiteColor,
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.appHorizontalLg * 0.5),
                    padding: EdgeInsets.all(AppSizes.appVerticalLg * 0.2),
                    decoration: BoxDecoration(
                        color: kPostBG,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: kWhatsHappening,
                            hintStyle:
                            TextStyle(fontSize: 20.0, color: kPostTextColor),
                            border: InputBorder.none,
                          ),
                        ),
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
                                  txt: kPost,
                                  onPressed: null,
                                  bgColor: kWhiteColor,
                                  textColor: kPostBG,
                                  isPadding: false),
                            )
                          ],
                        ),
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
                            width: AppSizes.screenWidth,
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.appVerticalLg * 0.3
                            ),
                            child: Row(
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
                                            "images/profile_img.png",
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
                                        SizedBox(
                                          height: AppSizes.appHorizontalLg * 0.3,
                                        ),
                                        Container(
                                            height: 200,
                                            width: double.infinity,
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
                                                       // Navigator.pushNamed(context, MessageViewPage.id);
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
                                                        Navigator.pushNamed(context,MessageViewPage.id);

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
                                  ),
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

          ],
        ));




  }
}
