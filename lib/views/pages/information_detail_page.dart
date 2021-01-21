import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';

import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/web_view_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationDetailPage extends StatelessWidget {
  static const id = "information_detail_page";

  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
        backgroudColor: kGrayColorBG,
        backgroundImage: false,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSizes.appVerticalLg * 0.2,
              ),
              InkWell(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: AppSizes.appHorizontalLg * 0.5),
                  child: Icon(
                    FontAwesomeIcons.arrowLeft,
                    color: kWhiteColor,
                    size: 20,
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/legal_info_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kLegalInformation,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/announces_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              kDiffusionRules,
                              style: boldText(color: kWhiteColor),
                            )),
                      ),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/cgu_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kCGU,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/cgv_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kCGV,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/help_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kHelp,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/warning_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kWarnings,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/rights_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kRightsAndObligations,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/privaciy_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kPrivacy,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .25,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, WebViewPage.id);
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: kProfileGray,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.6,
                    vertical: AppSizes.appHorizontalLg * 0.6,
                  ),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/contact_us_icon.png"),
                        width: AppSizes.appVerticalLg * 0.4,
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                kContactUs,
                                style: boldText(color: kWhiteColor),
                              ))),
                      Container(
                        width: AppSizes.appVerticalLg * 0.4,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSizes.appHorizontalLg * .4,
              ),
            ],
          ),
        ));
  }
}
