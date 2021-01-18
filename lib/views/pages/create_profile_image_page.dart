

import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:dogluv_user_app/utils/volidators.dart';
import 'package:dogluv_user_app/views/pages/Signin_page.dart';
import 'package:dogluv_user_app/views/pages/base_scaffold.dart';
import 'package:dogluv_user_app/views/pages/register_page.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:dogluv_user_app/views/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';


class CreateProfileImagePage extends StatefulWidget {
  static const id="create_profile_image_page";
  @override
  _CreateProfileImagePageState createState() => _CreateProfileImagePageState();
}

class _CreateProfileImagePageState extends State<CreateProfileImagePage> {
  bool uploadPhoto=false;
  @override
  Widget build(BuildContext context) {

    final _notifier = Provider.of<AuthViewModel>(context);
    Future<Null> _cropImage( bool isGallery  ) async {
      Navigator.pop(context);
      if(isGallery)
        _notifier.createDogProfileImageFile  = await ImagePicker.pickImage(source: ImageSource.gallery);
      else
        _notifier.createDogProfileImageFile  = await ImagePicker.pickImage(source: ImageSource.camera);

      File croppedFile = await ImageCropper.cropImage(
          sourcePath: _notifier.createDogProfileImageFile.path,
          aspectRatioPresets: Platform.isAndroid
              ? [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ]
              : [
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio5x3,
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.ratio7x5,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: kColorPrimary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            title: 'Cropper',
          ));
      if (croppedFile != null) {

        setState(() {
          uploadPhoto=true;
          _notifier.createDogProfileImageFile=croppedFile;
          print("----------cropper image: $_notifier.createProfileImageFile------------");
        });
        setState(() {

        });
      }
    }
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        backgroundColor:Color(0x01000000),
        content: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kDialogColorBG,
                  borderRadius:
                  BorderRadius.all(new Radius.circular(10.0)),
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppSizes.appVerticalLg * 0.3
                ),

                child:
                Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        print("----------adfasdf--------");
                        _cropImage(false);


                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6
                        ),
                        child: Text(kTakePhoto,style: boldText(color: kGrayText),),
                      ),
                    ),
                    Divider(thickness: 1,),
                    InkWell(
                      onTap: () async {
                        print("----------adfasdf--------");
                        _cropImage(true);


                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.appHorizontalLg * 0.6,
                            vertical: AppSizes.appVerticalLg * 0.1
                        ),
                        child:Text(kChooseFromLibrary,style: boldText(color: kGrayText),),
                      ),
                    ),

                  ],
                )
                ,),
              SizedBox(height: AppSizes.appVerticalLg * 0.3,),
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
                  width:double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text("Cancel",style: simpleText(color: kBlueColor,fontSize: 20))),
                ),
              ) ,
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
    AppSizes().init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: AppSizes.appVerticalLg * 0.3
            ),
            child:Center(child: Text(LetsDogsProfile,style:simpleText(fontSize: 18,color: kWhiteColor))),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  InkWell(
                    onTap: (){
                      showAlertDialog(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                      width: AppSizes.appVerticalLg * 1.7,
                      height: AppSizes.appVerticalLg * 1.7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kBlueColor,  // red as border color
                          ),
                          shape: BoxShape.circle,
                          image:DecorationImage(
                              image:_notifier.createDogProfileImageFile!= null ? FileImage(_notifier.createDogProfileImageFile): AssetImage("images/dog_profile.png",),
                              fit: BoxFit.fill

                          )
                      ),

                    ),
                  ),
                  /*Container(

                    child: Row(children: [
                      Expanded(child: ,),
                      Expanded(child: Container(
                        margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                        width: AppSizes.appVerticalLg * 1.7,
                        height: AppSizes.appVerticalLg * 1.7,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: kWhiteColor,  // red as border color
                            ),
                            shape: BoxShape.circle,
                            image:DecorationImage(
                                image: AssetImage("images/add_icon.png",),
                                fit: BoxFit.fill

                            )
                        ),

                      ),),
                      Expanded(child: Container(
                        margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                        width: AppSizes.appVerticalLg * 1.7,
                        height: AppSizes.appVerticalLg * 1.7,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: kWhiteColor,  // red as border color
                            ),
                            shape: BoxShape.circle,
                            image:DecorationImage(
                                image: AssetImage("images/add_icon.png",),
                                fit: BoxFit.fill

                            )
                        ),

                      ),)
                    ],),
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.appHorizontalLg * 0.2
                    ),
                  ),*/
                  Container(

                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.appHorizontalLg * 3
                            ),
                            width: double.infinity,

                            child: roundRectangleBtn(txt: kContinue,textColor: kLightBlue,bgColor:kWhiteColor)),
                        SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppSizes.appHorizontalLg * 3
                          ),

                          width: double.infinity,
                          child: roundTransparentBtn(txt: kSkip,bgColor: Color(0x00000000)),
                        ),
                        SizedBox(height: AppSizes.appVerticalLg * 0.3,),
                      ],
                    ),
                  ),




                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}

