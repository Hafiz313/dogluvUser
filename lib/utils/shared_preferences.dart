

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String kLoginId= "login_response";
const String kIsLogin= "check_is_login";

class SessionManager {

//set data into shared preferences like this
  Future<void> setLoginResponse(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(kLoginId, json.encode(value));
  }

//get value from shared preferences
  Future<String> getLoginResponse(String strName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
      strName = json.decode(pref.getString(kLoginId))["response"];
    return strName ;
   // return json.decode(pref.getString(kLoginId)) ?? null;
  }

/*  Future<void> read() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      strName =
          json.decode(prefs.getString("login_response"))["response"][0]["name"]?? "";
      userId=
          json.decode(prefs.getString("login_response"))["response"][0]["id"]?? "";
      imageUrl =
          json.decode(prefs.getString("login_response"))["response"][0]["img"]?? "";

      if(imageUrl==null || imageUrl.isEmpty || imageUrl==""){

        setState(() {
          print("----------------no ok url--------------");
          isUrl=true;
        });
      }


      strMail = json.decode(prefs.getString("login_response"))["response"][0]
      ["email"] ?? "";
      strAddress = json.decode(prefs.getString("login_response"))["response"][0]
      ["address"] ?? "";
      strPhoneNo = json.decode(prefs.getString("login_response"))["response"][0]
      ["phone"] ?? "";
    });
    print(
        "-----------------------login data in profile ${json.decode(prefs.getString("login_response"))["response"][0]["name"]}-------------------");
    print("-----------name: $strName emaill :$strMail, address: $strAddress phone $strPhoneNo imageUrl: $imageUrl --------");
    return json.decode(prefs.getString("login_response"));
  }*/
}