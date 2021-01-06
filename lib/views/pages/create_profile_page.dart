import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_constant.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/app_text_styles.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:dogluv_user_app/views/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:dogluv_user_app/core/veiwmodels/auth_viewmodel.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class CreateProfilePage extends StatefulWidget {
  static const id="create_profile_page";
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  bool uploadPhoto=false;
  @override
  Widget build(BuildContext context) {
    final _notifier = Provider.of<AuthViewModel>(context);
    Future<Null> _cropImage( bool isGallery  ) async {
      Navigator.pop(context);
      if(isGallery)
      _notifier.createProfileImageFile  = await ImagePicker.pickImage(source: ImageSource.gallery);
      else
        _notifier.createProfileImageFile  = await ImagePicker.pickImage(source: ImageSource.camera);

      File croppedFile = await ImageCropper.cropImage(
          sourcePath: _notifier.createProfileImageFile.path,
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
          _notifier.createProfileImageFile=croppedFile;
          print("----------cropper image: $_notifier.createProfileImageFile------------");
        });
        setState(() {

        });
      }
    }
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        backgroundColor:Color(0x01000000) ,
        contentPadding: EdgeInsets.fromLTRB(0,0,0,0),
        content: Container(
            color: Color(0x01000000),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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

    return Stack(
      children: [

        Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Text(kLetCreateProfile,style: simpleText(color: kWhiteColor,fontSize: 20),),
              InkWell(
                onTap: (){
                  showAlertDialog(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: AppSizes.appVerticalLg * 0.8),
                  width: AppSizes.appVerticalLg * 2.5,
                  height: AppSizes.appVerticalLg * 2.5,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: kBlueColor,  // red as border color
                      ),
                      shape: BoxShape.circle,
                      image:DecorationImage(
                          //image: AssetImage("images/profile_img.png",),
                          image: _notifier.createProfileImageFile!= null ? FileImage(_notifier.createProfileImageFile):AssetImage("images/profile_img.png"),
                          fit: BoxFit.fill

                      )
                  ),

                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(

                horizontal: AppSizes.appHorizontalLg * 3
            ),
            child: roundRectangleBtn(
                bgColor: kWhiteColor,txt: kContinue ,textColor: kBlueColor
                ,onPressed: (){
            }
            ),
          ),
        )


      ],);
  }
}





