import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    this.label,
    this.padding,
    this.groupValue,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool groupValue;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue)
          onChanged(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

          Radio<bool>(
            groupValue: groupValue,
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
          Text(label),
        ],
      ),
    );
  }
}

// ...
/*

bool _isRadioSelected = false;

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <LabeledRadio>[
        LabeledRadio(
          label: 'This is the first label text',
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          value: true,
          groupValue: _isRadioSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isRadioSelected = newValue;
            });
          },
        ),
        LabeledRadio(
          label: 'This is the second label text',
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          value: false,
          groupValue: _isRadioSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isRadioSelected = newValue;
            });
          },
        ),
      ],
    ),
  );
}*/
