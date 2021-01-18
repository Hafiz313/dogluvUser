import 'package:dogluv_user_app/utils/app_color.dart';
import 'package:dogluv_user_app/utils/app_sizes.dart';
import 'package:flutter/material.dart';



Widget simpleTxtField({
  bool ishidden = false,
  @required labelTxt,
  @required keyboardType,
  @required onsaved,
  @required validator,
}) {
  return TextFormField(

    style: TextStyle(color: Colors.white),
    obscureText: ishidden,
    keyboardType: keyboardType,
   onSaved: onsaved,
    validator: validator,
    decoration: InputDecoration(
        labelText: labelTxt,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide:  BorderSide(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(color: Colors.white)),
  );
}

// ignore: non_constant_identifier_names
Widget TxtFieldNonBorder({
  bool ishidden = false,
  @required keyboardType,
  @required onsaved,
  @required validator,
  Color labelTextColor
}) {
  return TextFormField(

    style: TextStyle(color: Colors.white),
    obscureText: ishidden,
    keyboardType: keyboardType,
    onSaved: onsaved,
    validator: validator,
    decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: TextStyle(color:labelTextColor ?? Colors.white)),
  );
}