import 'package:flutter/material.dart';
import '../constants.dart';

class BottonButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottonButton(this.onTap, this.buttonTitle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
            child: Text(
              buttonTitle,
              style: KButtonLargeTextStyle,
            )),
        color: KBottonContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: KBottonContainerHeight,
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}