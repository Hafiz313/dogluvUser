import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/background_circle.dart';
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

class RecentChatPage extends StatefulWidget {
  static const id = "recent_chat_page";

  @override
  _RecentChatPageState createState() => _RecentChatPageState();
}

class _RecentChatPageState extends State<RecentChatPage> {
//  AdoptionOrSale selector = AdoptionOrSale.adoption;
  PhysicalOrWebstore selector = PhysicalOrWebstore.physical;

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: Builder(
        builder: (BuildContext context){
          return Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(
                        top: AppSizes.appVerticalLg * 0.3,
                      ),
                      child: Text(kRecentChats,
                          style: boldText(fontSize: 20, color: kWhiteColor)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: AppSizes.appVerticalLg * 0.3,
                        vertical: AppSizes.appVerticalLg * 0.3,
                      ),
                      child: Image(
                        image: AssetImage("images/arrow_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ))),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.all(
                      AppSizes.appVerticalLg * 0.5,
                    ),
                    child: CircleButton(
                      iconData: FontAwesomeIcons.bars,
                      iconColor: Colors.white,
                      iconSize: 15,
                    )),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin:EdgeInsets.only(top:   AppSizes.appVerticalLg * 1.1,),
                  child: Column(
                    children: [
                       Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appVerticalLg * 0.3),
                        color: Colors.black,
                        child: Text(
                          '$kMATCHES',
                          style: simpleText(
                              fontWeight: FontWeight.w700, color: kPostDialogCross),
                        ),
                      ),
                      SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                      Container(
                        height: AppSizes.appVerticalLg * 1.25,
                        child: ListView.builder(
                          reverse: false,
                          scrollDirection: Axis.horizontal,
                          itemCount:20,
                          itemBuilder: (context, position) {
                            return InkWell(
                              onTap: (){
                               print("-----------ajdksf-----");
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.1),
                                width: AppSizes.appVerticalLg * 1.2,
                                height: AppSizes.appVerticalLg * 1.2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: kBlueColor,  // red as border color
                                    ),
                                    shape: BoxShape.circle,
                                    image:DecorationImage(
                                      //image: AssetImage("images/profile_img.png",),
                                        image:AssetImage("images/profile_man.png"),
                                        fit: BoxFit.fill

                                    )
                                ),

                              ));

                          },
                        ),
                      ),
                      SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appVerticalLg * 0.3),
                        color: Colors.black,
                        child: Text(
                          '$kCONVERSATIONS',
                          style: simpleText(
                              fontWeight: FontWeight.w700, color: kPostDialogCross),
                        ),
                      ),
                      SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }
}
