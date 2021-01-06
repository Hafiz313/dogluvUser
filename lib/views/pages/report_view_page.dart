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

class ReportViewPage extends StatefulWidget {
  static const id = "report_view_page";

  @override
  _ReportViewPageState createState() => _ReportViewPageState();
}

class _ReportViewPageState extends State<ReportViewPage> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        backgroundImage: false,
        backgroudColor: kGrayColorBG,
        body:

        Padding(
          padding:  EdgeInsets.symmetric(
            vertical:AppSizes.appVerticalLg * 1,
            horizontal: AppSizes.appHorizontalLg * 0.5,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image(
                  image:AssetImage("images/reported_img.png"),),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image(
                  image:AssetImage("images/reported_dog_img.png"),),
              )
            ],
          ),
        )
        );




  }
}
