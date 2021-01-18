import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullScreenDialog extends StatefulWidget {
  String _skillOne = "You have";
  String _skillTwo = "not Added";
  String _skillThree = "any skills yet";

  @override
  FullScreenDialogState createState() => new FullScreenDialogState();
}

class FullScreenDialogState extends State<FullScreenDialog> {
  TextEditingController _skillOneController = new TextEditingController();
  TextEditingController _skillTwoController = new TextEditingController();
  TextEditingController _skillThreeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 200,
    );
  }


}
