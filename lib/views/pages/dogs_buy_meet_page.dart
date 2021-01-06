import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/base_view.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';


class DogsBuyMeetPage extends StatefulWidget {
  static const id= "dogs_buy_meet_page";
  @override
  _DogsBuyMeetPageState createState() => _DogsBuyMeetPageState();
}

class _DogsBuyMeetPageState extends State<DogsBuyMeetPage> {
  @override
  Widget build(BuildContext context) {
    Gender selector= Gender.male;
    return BaseScaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              width: AppSizes.appVerticalLg * 5,
              height: AppSizes.appVerticalLg * 1,
              child: Card(
                 shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),color: kWhiteColor,
                child: Row(
                  children: [

                    Expanded(child: roundRectangleBtn(txt: "Male",
                        textColor:selector==Gender.male ? Colors.white:Colors.black,
                        bgColor: selector==Gender.male ?Colors.black:Colors.green,fontSize: 10,
                        onPressed:(){
                          setState(() {
                            print("djksfaklads");
                            selector=Gender.male;
                           // _notifier.signUpGender= "Male";
                          });
                        }

                    )),
                    SizedBox(width: AppSizes.appHorizontalLg * 0.5,),
                    Expanded(child: roundRectangleBtn(txt: "Female",
                        textColor:  selector==Gender.feMale ? Colors.white:Colors.black,
                        bgColor: selector==Gender.feMale ?Colors.black:Colors.green,
                        fontSize: 10,
                        onPressed:(){
                          setState(() {
                            print("djksfaklads");
                            selector=Gender.feMale;
                            //_notifier.signUpGender= "Female";
                          });
                        }
                    )),


                  ],
                ),

              ),
            )
          ],
        ),
      ),

    );



  }
}
