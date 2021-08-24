import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomBarColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.only(top: kCardMargin),
        child: Center(
          child: Text(
            buttonTitle,
            style: kCalcTextStyle,
          ),
        ),
      ),
    );
  }
}
