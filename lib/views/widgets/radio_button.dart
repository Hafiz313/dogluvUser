import 'package:flutter/material.dart';

Widget _myRadioButton({String title, int value, Function onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: -1,
    onChanged: onChanged,
    title: Text(title),
  );
}