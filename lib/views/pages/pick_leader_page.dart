import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/bay_package.dart';
import 'package:dogluv_user_app/views/pages/my_profle.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dogluv_user_app/views/pages/package_leader_page.dart';
class PickLeaderPage extends StatefulWidget {
  final String name;
  static const id = "pick_leader_page";

  const PickLeaderPage({Key key, this.name}) : super(key: key);
  @override
  _PickLeaderPageState createState() => _PickLeaderPageState();
}

class _PickLeaderPageState extends State<PickLeaderPage> {
//  AdoptionOrSale selector = AdoptionOrSale.adoption;
  PhysicalOrWebstore selector = PhysicalOrWebstore.physical;


  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return BaseScaffold(
      backgroundImage: false,
      backgroudColor: kGrayColorBG,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(
                        top: AppSizes.appVerticalLg * 0.3,
                      ),
                      child: Text(kPackLeaderOfMonth,
                          style: boldText(fontSize: 20, color: kWhiteColor)))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.only(
                        left: AppSizes.appVerticalLg * 0.4,
                        top: AppSizes.appVerticalLg * 0.32,
                      ),
                      child: Icon(
                        FontAwesomeIcons.arrowLeft,
                        color: kWhiteColor,
                        size: 20,
                      )
                  )
              ),
              Align(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 1.5),
                      height: AppSizes.appVerticalLg * 3.5,
                      width: AppSizes.appVerticalLg * 5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:  AssetImage("images/img_border.png"),
                          fit: BoxFit.fill
                        ),

                      ),
                      child:  Center(
                        child: Container(
                         // margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                          width: AppSizes.appVerticalLg * 2,
                          height: AppSizes.appVerticalLg * 2,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: kYellowImageBorder,  // red as border color
                              ),
                              shape: BoxShape.circle,
                              image:DecorationImage(
                                  image:/*_notifier.createDogProfileImageFile!= null ? FileImage(_notifier.createDogProfileImageFile): */AssetImage("images/dog_profile.png",),
                                  fit: BoxFit.fill
                              )
                          ),

                        ),
                      ),

                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: AppSizes.appVerticalLg * 0.3,
                        ),
                        child: Text(kName,
                            style: boldText(fontSize: 24, color: kWhiteColor))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(kCurrentPackLeader,
                        style: boldText(fontSize: 20, color: kPinkColor)),
                        Text(kBoostUser,
                        style: boldText(fontSize: 22, color: kWhiteColor)),

                      ],
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, BayPackagePage.id);
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:AppSizes.appHorizontalLg * 1,
                                right:AppSizes.appHorizontalLg * 1,
                                   top :AppSizes.appHorizontalLg * 0.8
                            ),
                            decoration: BoxDecoration(
                                color: kPinkColor,
                                borderRadius: BorderRadius.circular(20)
                            ),
                           width: double.infinity,
                            height: AppSizes.appVerticalLg * 2.5,
                            child: Column(children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    top: AppSizes.appVerticalLg * 1,
                                  ),
                                  child: Text(kName,
                                      style: boldText(fontSize: 20, color: kWhiteColor))),
                              Container(
                                  margin: EdgeInsets.only(
                                    top: AppSizes.appVerticalLg * 0.03,
                                  ),
                                  child: Text("Since 1D 6H 30M",
                                      style: boldText(fontSize: 20, color: kWhiteColor))),

                            ],),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kWhiteColor,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: AppSizes.appVerticalLg * 0.7,
                              backgroundImage: AssetImage("images/dog_profile.png"),
                              child: false ? Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: AppSizes.appVerticalLg * 0.2,
                                  backgroundImage: AssetImage("images/foot_icon_yellow.png"),
                                ),
                              ): null,

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(kCurrentPackLeader,
                            style: boldText(fontSize: 20, color: kGreenLeaderColor)),
                        Text(kBoostUser,
                            style: boldText(fontSize: 22, color: kWhiteColor)),

                      ],
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left:AppSizes.appHorizontalLg * 1,
                              right:AppSizes.appHorizontalLg * 1,
                              top :AppSizes.appHorizontalLg * 0.8
                          ),
                          decoration: BoxDecoration(
                              color: kGreenLeaderColor,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          width: double.infinity,
                          height: AppSizes.appVerticalLg * 2.5,
                          child: Column(children: [
                            Container(
                                margin: EdgeInsets.only(
                                  top: AppSizes.appVerticalLg * 1,
                                ),
                                child: Text(kName,
                                    style: boldText(fontSize: 20, color: kWhiteColor))),
                            Container(
                                margin: EdgeInsets.only(
                                  top: AppSizes.appVerticalLg * 0.03,
                                ),
                                child: Text("Since 1D 6H 30M",
                                    style: boldText(fontSize: 20, color: kWhiteColor))),

                          ],),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: kWhiteColor,
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: AppSizes.appVerticalLg * 0.7,
                              backgroundImage: AssetImage("images/dog_profile.png"),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: CircleAvatar(
                                  radius: AppSizes.appVerticalLg * 0.2,
                                  backgroundImage: AssetImage("images/foot_icon_yellow.png"),
                                ),
                              ),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.5,),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, position) {
                        return  Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: AppSizes.appVerticalLg * 0.4,
                                    vertical:AppSizes.appVerticalLg * 0.1,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text(
                                      '${position+1}',
                                      style: simpleText(fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                                    Stack(
                                      children: [
                                        Container(
                                          width: AppSizes.blockSizeVertical * 6.5,
                                          height: AppSizes.blockSizeVertical * 6.5,
                                          decoration: BoxDecoration(
                                              color: kColorPrimary,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.white, width: 2),
                                              image: DecorationImage(
                                                  image: AssetImage('images/dog_profile.png'))),
                                        ),
                                        Positioned(
                                          //  bottom: 2,
                                          right: 0,
                                          child:CircleAvatar(
                                            radius: AppSizes.appVerticalLg * 0.15,
                                            backgroundImage: AssetImage("images/foot_icon_yellow.png"),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                                    Text(
                                      ' name $position',
                                      style: simpleText(fontWeight: FontWeight.w700),
                                    ),
                                  ],),
                                  Text(
                                    ' name $position',
                                    style: simpleText(fontWeight: FontWeight.w700,color: kPostDialogCross),
                                  ),


                                ],
                              ),
                            ),
                            Divider(thickness: 1,color: kDividerGrayColor,)
                          ],
                        );
                      },
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                    Container(
                      width: double.infinity,
                      color: Colors.black,
                      child: Center(
                        child: Text(
                          '$kYOUR_RANK',
                          style: simpleText(fontWeight: FontWeight.w700,color: kPostDialogCross),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.appVerticalLg * 0.2,),
                    Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.appVerticalLg * 0.4,
              vertical:AppSizes.appVerticalLg * 0.1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Text(
                    '9',
                    style: simpleText(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                  Stack(
                    children: [
                      Container(
                        width: AppSizes.blockSizeVertical * 6.5,
                        height: AppSizes.blockSizeVertical * 6.5,
                        decoration: BoxDecoration(
                            color: kColorPrimary,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                                image: AssetImage('images/dog_profile.png'))),
                      ),
                      Positioned(
                        //  bottom: 2,
                        right: 0,
                        child:CircleAvatar(
                          radius: AppSizes.appVerticalLg * 0.15,
                          backgroundImage: AssetImage("images/foot_icon_yellow.png"),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: AppSizes.appVerticalLg * 0.2,),
                  Text(
                    'name',
                    style: simpleText(fontWeight: FontWeight.w700),
                  ),
                ],),
                Text(
                  ' name',
                  style: simpleText(fontWeight: FontWeight.w700,color: kPostDialogCross),
                ),


              ],
            ),
          ),
                    Divider(thickness: 1,color:kDividerGrayColor,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, BayPackagePage.id);
                      },
                      child: Container(
                         margin: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.5,vertical: AppSizes.appVerticalLg * 0.3 ),
                        padding: EdgeInsets.symmetric(horizontal: AppSizes.appHorizontalLg * 0.4),
                        width: double.infinity,
                        height: AppSizes.appVerticalLg * 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              width: 2,
                              color: kYellowImageBorder,  // red as border color
                            ),
                            shape: BoxShape.rectangle,

                        ),
                        child: Stack(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Image(image: AssetImage("images/king_icon.png"),width: AppSizes.appVerticalLg * 0.4,)),
                          Align(
                              alignment: Alignment.center,
                              child: Text("$kBE_THE_NEXT_PACK_LEADER",style:simpleText(color:kWhiteColor,fontSize: 18)),),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Image(image: AssetImage("images/king_icon.png"),width: AppSizes.appVerticalLg * 0.4,)),
                        ],),



                      ),
                    ),





                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged,int groupValue}) {
    final _notifier = Provider.of<AuthViewModel>(context);
    return Container(
      transform: Matrix4.translationValues(-30.0, 0.0, 0.0),
      child: RadioListTile(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Container(
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: Text(
            title,
            style: simpleText(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
