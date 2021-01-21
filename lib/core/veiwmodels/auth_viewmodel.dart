import 'dart:convert';

import 'package:dogluv_user_app/core/veiwmodels/base_view_model.dart';
import 'package:dogluv_user_app/utils/app_api_ref.dart';
import 'package:dogluv_user_app/utils/app_state.dart';
import 'package:dogluv_user_app/utils/shared_preferences.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as _http;
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  bool isSignupApi;

  AuthApi({@required this.isSignupApi});

  postData(data) async {
    return await _http.post(
      isSignupApi ? kSignUpApi : kSignInApi,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  getData() async {
    return await _http.get(
      isSignupApi ? kSignUpApi : kSignInApi,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}

class AuthViewModel extends BaseViewmodel {
  SessionManager _sessionManager;
  List<String> languageItemsArray = [
    'Select Language',
    'Arabic',
    'Bengali',
    'Chinese',
    'Espagnol',
    'French',
    'German',
    'Hindi',
    'Italian',
    'Japanese',
    'Korean',
    'Portuguese',
    'Russian',
  ];

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInForm = GlobalKey<FormState>();
  GlobalKey<FormState> createDogsProfileFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> createProfileForm = GlobalKey<FormState>();
  GlobalKey<FormState> offerFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> sendRequestChildFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> sendRequestMainFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> sellServicesFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> manageProfileFormKey = GlobalKey<FormState>();
  //AdoptionOrSale selector = AdoptionOrSale.adoption;
  String
      signUpUserName,
      signUpEmail,
      signUpPassword,
      signUpConformPassword,
      languageSelectValue = 'Select Language',
      signUpAge,
      signInEmail,
      forgetPasswordEmail,
      signInPassword,
      dogsNameProfile,
      offerPrice,
      sendRequestNameChild,
      sendRequestAge,
      sendRequestAdditionalPeople,
      sendRequestDogsCare,
      sendRequestUnableCare,
      sendRequestSleepNight,
      sendRequestHourLeftAlone,
      sendRequestLeftAlone,
      sendRequestDosExercised,
      sendRequestAdoptDogsOther,
      storeName,
      firstNameManageProfile,
      emailManageProfile,
      strDiscountCode,
      offerNoOfAnimals,
      offerAddRegNo,
      offerCompanyReg,
      offerAboutDog,
      sellServiceAddress,
      tellUsServices,
      strAdoptionOrSale="Adoption",
      strPhysicalOrWebsoter="Physical Address",
      //strAdoptionOrSale="Adoption",
      dogsDescriptionProfile,
      authMsg,
      createProfileName;
  File createProfileImageFile;
  File createDogProfileImageFile;
  File sellServicesImageFile;
  bool authError = true;
  bool isSignIn = false;
  bool isOfferForm = false;
  bool isSearchForm = false;
  bool isCreateProfileForm = false;
  bool isCreateDogsProfileForm = false;
  bool isSellServicesForm = false;
  bool isProSeller= false;
  bool isAvailableAdoption= false;
  bool isSignUp = false;
  bool isForgetPassword = false;
  bool isReportMassage = false;
  String ageValue = 'Select Age';
  String localisationValue = 'Select Localisation';
  String ageDogsValue = 'Select Age';
  String dogsSexValue = 'Select Sex';
  String breedValue = 'Select Breed';
  String localisationDogsValue = 'Select Localisation';
 // int groupValue = -1;
  int purebredNonPurebredGroup =0;
  int isThisYourGroup =0;
  int isHouseHoldAllergies =0;
  int isSendRequestDogsYear =0;
  int isSendRequestOwnRent =0;
  int isSendRequestFollowingDogs =0;
  int isSendRequestHaveFence =0;
  int isSendRequestFirstPet =0;
  int isSendRequestOtherPet =0;
  int isSendRequestAdoptDogs =0;
  int isYourAnimalGroup =0;
  int isMicroChippedGroup =0;
  List<String> localisationDogsItems = [
    'Select Localisation',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  List<String> breedItems = [
    'Select Breed',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];

  List<String> dogSexItems = [
    'Select Sex',
    'Male',
    'Female',
  ];

  List<String> agesDogsItems = [
    'Select Age',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  List<String> agesItems = [
    'Select Age',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  List<String> localisationValueItems = [
    'Select Localisation',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  String offerSexValue = 'Select Sex';
  List<String> offerSexItems = [
    'Select Sex',
    'Man',
    'Female',
  ];
  String searchSexValue = 'Select Sex';
  List<String> searchSexItems = [
    'Select Sex',
    'Man',
    'Female',
  ];
  String searchDistanceValue = 'Select Distance';
  List<String> searchDistanceItems = [
    'Select Distance',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];


  String sellServiceActivityValue = 'Select Activity';
  String searchBreedValue = 'Select Breed';
  List<String> searchBreedItems = [
    'Select Breed',
    'Arabic',
  ];
    String offerBreedValue = 'Select Breed';
  List<String> offerBreedItems = [
    'Select Breed',
    'Arabic',
  ];
  List<String> sellServicesActivityItems = [
    'Select Activity',
    'Arabic',
  ];
  String offerAgeValue = 'Under 8 weeks';
  List<String> offerAgeItems = [
    'Under 8 weeks',
    'Arabic',
  ];
  String searchAgeValue = 'Select Age';
  List<String> searchAgeItems = [
    'Select Age',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  ];

  bool validateAndSave({
    @required FormState formstate,
  }) {
    final form = formstate;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmitSignUp() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: signUpFormKey.currentState)) {
        print("------------------Email: $signUpEmail  Password : $signUpPassword  C_Password : $signUpConformPassword language: $languageSelectValue --------------");
        final response = await http.post(kSignUpApi, body: {
          "email": signUpEmail,
          "password": signUpPassword,
          "cpassword": signUpConformPassword,
          "lang": languageSelectValue
        });
        var body = json.decode(response.body);
        if (body['status']) {
          print("-----------------$body------------------");
          // _sessionManager.setLoginResponse("adsfjkl");
          isSignUp = true;
          authError = false;
          prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);
          // authMsg = body['message'];
        } else {
          authError = true;
          //  authMsg = body['message'];
          print(
              "-------------------Sign  in not success${authMsg = body['message']}----------------");
        }
      }
      else{

        authMsg = "Please fill all field";
      }

      print("not success");
      authError = false;
    } catch (e) {
     // authMsg = e.message.toString();
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateAndSubmitSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: signInForm.currentState)) {
        print(
            "------------------Email: $signInEmail  Password : $signInPassword --------------");
        final response = await http.post(kSignInApi,
            body: {"email": signInEmail, "password": signInPassword});
        var body = json.decode(response.body);
        if (body['status']) {
          print("-----------------$body------------------");
          setState(ViewState.kIdle);

          isSignIn = true;
          authError = false;
          authMsg = body['message'];
          prefs.setString(kLoginId, json.encode(body));
          prefs.setBool(kIsLogin, true);
        } else {
          authError = true;
          authMsg = body['message'];
          print(
              "-------------------Sign  in not success${authMsg = body['message']}----------------");
        }
      }
      else{

         authMsg = "Please fill all field";
      }
      print("not success");
      authError = false;

    } catch (e) {

      print("-------------------Sign  in not success${ e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);

  }
  Future<void> validateAndSubmitForgetEmail() async {
    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: forgetFormKey.currentState)) {
        print("------------------Email: $forgetPasswordEmail--------------");
        final response =
            await http.post(kForgetApi, body: {"femail": forgetPasswordEmail});
        var body = json.decode(response.body);
        if (body['status']) {
          print("-----------------$body------------------");
          // _sessionManager.setLoginResponse(response.body);
          isForgetPassword = true;
          authError = false;
          authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
          print("-------------------SignIn not success${authMsg = body['message']}----------------");
        }
      }
      print("not success");
      authError = false;
    } catch (e) {
      authMsg = e.message.toString();
      print("-------------------SignIn not success${e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateAndSubmitCreateProfileFrom() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    try {
      if (validateAndSave(formstate: createProfileForm.currentState)) {
        print(
            "-----------------user Id :$userId name: $createProfileName  age : $ageValue laoc :$localisationValue , image:$createProfileImageFile--------------");
        final file = await http.MultipartFile.fromPath('img', createProfileImageFile.path);
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(kCreateProfileApi));
        imageUploadRequest.fields['id'] = "$userId";
        imageUploadRequest.fields['name'] = createProfileName;
        imageUploadRequest.fields['age'] = ageValue;
        imageUploadRequest.fields['localization'] = localisationValue;
        imageUploadRequest.files.add(file);
        final streamedResponse = await imageUploadRequest.send();
        final response = await http.Response.fromStream(streamedResponse);
        var body = json.decode(response.body);
        print("-----------------$body------------------");
        if (body['status']) {
          print("-----------------after check $body------------------");
          isCreateProfileForm = true;
          authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
        }
      }
      print("not success");
      authError = false;
    } catch (e) {
      //authMsg = e.message.toString();
    //  print("------------------------${e.message.toString()}-------------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateAndSubmitDogsProfileFrom() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    print(
        "------------------id:$userId name: $dogsNameProfile  ageDogd : $ageDogsValue , sexDos $dogsSexValue, breed $breedValue,laoc :$localisationDogsValue ,des : $dogsDescriptionProfile, image:$createDogProfileImageFile--------------");

    try {
      if (validateAndSave(formstate: createDogsProfileFormKey.currentState)) {
        final file = await http.MultipartFile.fromPath(
            'img', createDogProfileImageFile.path);
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(kCreateDogsProfileApi));
        imageUploadRequest.fields['user_id'] = "$userId";
        imageUploadRequest.fields['name'] = dogsNameProfile;
        imageUploadRequest.fields['age'] = ageDogsValue;
        imageUploadRequest.fields['sex'] = dogsSexValue;
        imageUploadRequest.fields['breed'] = breedValue;
        imageUploadRequest.fields['localization'] = localisationDogsValue;
        imageUploadRequest.fields['description'] = dogsDescriptionProfile;
        imageUploadRequest.files.add(file);
        final streamedResponse = await imageUploadRequest.send();
        final response = await http.Response.fromStream(streamedResponse);
        var body = json.decode(response.body);

        if (body['status']) {
          print("-----------------$body------------------");
          isCreateDogsProfileForm = true;
          authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
        }
      }
      print("not success");
      authError = false;
    } catch (e) {
    //  authMsg = e.message.toString();
      print(
          "------------------------${e.message.toString()}-------------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateOfferForm() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = json.decode(prefs.getString(kLoginId))['response'][0]['id'];
    setState(ViewState.kBusy);
    try {

      if (validateAndSave(formstate: offerFormKey.currentState)) {
        print("------------------"
            "offer : $strAdoptionOrSale,"
            "userId : $userId,"
            "offerSexValue : $offerSexValue,"
            "offerBreedValue : $offerBreedValue,"
            "purebredNonPurebredGroup:$purebredNonPurebredGroup , "
            "isThisYourGroup:$isThisYourGroup , "
            "isYourAnimalGroup:$isYourAnimalGroup , "
            "isMicroChippedGroup:$isMicroChippedGroup , "
            "offerAgeValue:$offerAgeValue , "
            "price:$offerPrice , "
            "offerNoOfAnimals : $offerNoOfAnimals,"
            "offerAddRegNo :$offerAddRegNo,"
            " --------------");
        final response = await http.post(kOfferDogSell,
            body: {
              "offer": strAdoptionOrSale,
              "user_idF": userId,
              "sex": offerSexValue,
              "breed": offerBreedValue,
              "price": offerPrice,
              "location": "abc",
              "purebred": purebredNonPurebredGroup,
              "age": offerAgeValue,
              "number_puppies": offerNoOfAnimals,
              "puppy_registration": offerAddRegNo,
              "litter_registration": offerNoOfAnimals,
              "first_sale": isThisYourGroup,
              "vaccined": isYourAnimalGroup,
              "microchipped": isMicroChippedGroup,
              "company_registration": offerCompanyReg,
              "about_dog": offerAboutDog,

            });
        var body = json.decode(response.body);
        print("-----------------adsf$body------------------");
        if (body['status']) {
          print("-----------------adsf$body------------------");

          isOfferForm = true;
          authError = false;
        //  authMsg = body['message'];
        } else {
          authError = true;
         authMsg = body['message'];
          print("-------------------Sign  in not success${authMsg = body['message']}----------------");
        }
      }
      print("not success");
      authError = false;
    } catch (e) {
    //  authMsg = e.message.toString();
  //    print("-------------------Sign  in not success${ e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateSellServicesPost() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

   // print("------------------id:$userId name: $dogsNameProfile  ageDogd : $ageDogsValue , sexDos $dogsSexValue, breed $breedValue,laoc :$localisationDogsValue ,des : $dogsDescriptionProfile, image:$createDogProfileImageFile--------------");

    try {
      if (validateAndSave(formstate: sellServicesFormKey.currentState)) {

        print("------------------id:$userId phaysical :$strPhysicalOrWebsoter,"
            "name: $storeName  sellServiceActivityValue : $sellServiceActivityValue ,"
            "sellServiceAddress :$sellServiceAddress,"
            " strDiscountCode $strDiscountCode,"
            "tellUsServices :$tellUsServices ,"
            "image:$sellServicesImageFile--------------");

        final file = await http.MultipartFile.fromPath(
            'img', sellServicesImageFile.path);
        final imageUploadRequest =
        http.MultipartRequest('POST', Uri.parse(kStoreSellServices));
        imageUploadRequest.fields['user_id'] = "$userId";
        imageUploadRequest.fields['service'] = strPhysicalOrWebsoter;
        imageUploadRequest.fields['store_name'] = storeName;
        imageUploadRequest.fields['activity'] = sellServiceActivityValue;
        imageUploadRequest.fields['web_address'] = sellServiceAddress;
        imageUploadRequest.fields['discount_code'] = strDiscountCode;
        imageUploadRequest.fields['about_service'] = tellUsServices;
        imageUploadRequest.files.add(file);
        final streamedResponse = await imageUploadRequest.send();
        final response = await http.Response.fromStream(streamedResponse);
        var body = json.decode(response.body);

        if (body['status']) {
          print("-----------------$body------------------");
          isSellServicesForm = true;
          authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
        }
      }
      print("not success");
      authError = false;
    } catch (e) {
      //  authMsg = e.message.toString();
      print(
          "------------------------${e.message.toString()}-------------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateReportInappropriateMassagePost() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    try {
      print("------------------userId:$userId --------------");
      final response = await http.post(kInappropriateMsgApi, body: {"user_id": "13","report_by":"$userId","description":"hello this is reporter" });
      var body = json.decode(response.body);
      print("-----------------$body------------------");

        if (body['status']) {
          isReportMassage = true;
          authError = false;
          authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
          print("-------------------Msg: ${authMsg = body['message']}----------------");
        }
   //   }
      print("not success");
      authError = false;
    } catch (e) {
     authMsg = e.message.toString();
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateReportInappropriatePhotoPost() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    try {
      print("------------------photo userId:$userId --------------");
      final response = await http.post(kInappropriatePhotoApi, body: {"user_id": "1","report_by":"$userId","description":"hello this is reporter for photo" });
      var body = json.decode(response.body);
      print("-----------------${response.body}------------------");
      //  if (validateAndSave(formstate: forgetFormKey.currentState)) {


      if (body['status']) {
        isForgetPassword = true;
        authError = false;
        authMsg = body['message'];
      } else {
        authError = true;
        authMsg = body['message'];
        print("-------------------success${authMsg = body['message']}----------------");
      }
      //   }
      print("not success");
      authError = false;
    } catch (e) {
      authMsg = e.message.toString();
      print("-------------------SignIn not success${e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateReportInappropriateSpamPost() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    try {
      print("------------------Spam userId:$userId --------------");
      final response = await http.post(kInappropriateSpamApi, body: {"user_id": "1","report_by":"$userId","description":"hello this is reporter for photo" });
      var body = json.decode(response.body);
      print("-----------------${response.body}------------------");
      //  if (validateAndSave(formstate: forgetFormKey.currentState)) {


      if (body['status']) {
        isForgetPassword = true;
        authError = false;
        authMsg = body['message'];
      } else {
        authError = true;
        authMsg = body['message'];
        print("-------------------success${authMsg = body['message']}----------------");
      }
      //   }
      print("not success");
      authError = false;
    } catch (e) {
      authMsg = e.message.toString();
      print("-------------------SignIn not success${e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateReportInappropriateOtherPost() async {
    setState(ViewState.kBusy);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var userId = json.decode(pref.getString(kLoginId))['response'][0]['id'];

    try {
      print("------------------Other userId:$userId --------------");
      final response = await http.post(kInappropriateOtherApi, body: {"user_id": "1","report_by":"$userId","description":"hello this is reporter for photo" });
      var body = json.decode(response.body);
      print("-----------------${response.body}------------------");
      //  if (validateAndSave(formstate: forgetFormKey.currentState)) {


      if (body['status']) {
        isForgetPassword = true;
        authError = false;
        authMsg = body['message'];
      } else {
        authError = true;
        authMsg = body['message'];
        print("-------------------success${authMsg = body['message']}----------------");
      }
      //   }
      print("not success");
      authError = false;
    } catch (e) {
      authMsg = e.message.toString();
      print("-------------------SignIn not success${e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> validateSearchForm() async {

    setState(ViewState.kBusy);
    try {

      if (validateAndSave(formstate: searchFormKey.currentState)) {
        print("------------------"
            "searchDistanceValue : $searchDistanceValue,"
            "searchSexValue : $searchSexValue,"
            "searchBreedValue : $searchBreedValue,"
            "searchAgeValue:$searchAgeValue , "
            "isProSeller:$isProSeller , "
            "isAvailableAdoption:$isAvailableAdoption , "

            " --------------");
        final response = await http.post(kSearchFilterApi,
            body: {
              "distance":"12", //searchDistanceValue,
              "sex": "male",//searchSexValue,
              "breed": "bulldog",//searchBreedValue,
              "age": "2",//searchAgeValue,
              "status": "adopt",


            });
        var body = json.decode(response.body);
        print("-----------------$body------------------");
        if (body['status']) {
          print("-----------------$body------------------");

          isSearchForm = true;
          authError = false;
          //  authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
          print("-------------------Sign  in not success${authMsg = body['message']}----------------");
        }
      }
      else{
        authMsg="alksdfj";

      }
      print("not success");
      authError = false;
    } catch (e) {
      //  authMsg = e.message.toString();
      //    print("-------------------Sign  in not success${ e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> matchListApi() async {

    setState(ViewState.kBusy);
    try {
      if (validateAndSave(formstate: searchFormKey.currentState)) {
        final response = await http.post(kMatchListApi,
            body: {
              "id":"38", //searchDistanceValue,
            });
        var body = json.decode(response.body);
        print("-----------------$body------------------");
        if (body['status']) {
          print("-----------------$body------------------");

          isSearchForm = true;
          authError = false;
          //  authMsg = body['message'];
        } else {
          authError = true;
          authMsg = body['message'];
          print("-------------------Sign  in not success${authMsg = body['message']}----------------");
        }
      }
      else{
        authMsg="alksdfj";

      }
      print("not success");
      authError = false;
    } catch (e) {
      //  authMsg = e.message.toString();
      //    print("-------------------Sign  in not success${ e.message.toString()}----------------");
      authError = true;
    }
    setState(ViewState.kIdle);
  }
  Future<void> clearSharedPreferences(BuildContext context) async {

    setState(ViewState.kBusy);
    try {

      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.clear();
      Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
      print("-----------adlkfj----------------");


    } catch (e) {

    }

  }
}


