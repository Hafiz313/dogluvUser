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
class ChangeLanguagePage extends StatefulWidget {

  static const id = "change_language_page";

  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
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
                margin: EdgeInsets.only(top: AppSizes.appVerticalLg * .6),
                padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.appHorizontalLg * 0.5,
                    vertical: AppSizes.appVerticalLg * 0.5),
                child:Column(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(
                            vertical: AppSizes.appVerticalLg * .2),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          kLanguage,
                          style:
                          simpleText(fontSize: 15, color: kLightBlue),
                        )),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.appVerticalLg * 0.1,
                          horizontal: AppSizes.appHorizontalLg *0.3
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 1.0,
                        ),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.0),
                      ),

                      child:  DropdownButton<String>(

                        dropdownColor:kGrayColorBG,
                        isExpanded: true,
                        underline: SizedBox(),
                        value: _notifier.languageSelectValue,
                        icon: Icon(Icons.arrow_drop_down,color: Colors.white,),
                        iconSize: 24,
                        style: TextStyle(color: Colors.white, fontSize: 16),

                        onChanged: (String data) {
                          setState(() {
                            _notifier.languageSelectValue = data;
                          });
                        },
                        items: _notifier.languageItemsArray.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.7,),
                    Container(
                      width: double.infinity,

                      child: Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 2.5
                        ),
                        child: roundRectangleBtn(txt: kDone,textColor: kLightBlue,bgColor: Colors.white,


                        ),
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
                    padding: EdgeInsets.only(
                      top: AppSizes.appVerticalLg * 0.3,
                    ),
                    child: Text(kLanguage,
                        style: boldText(fontSize: 20, color: kWhiteColor)))
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Container(
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
                )
            ),
          ],
        ),
      ),
    );
  }

}
