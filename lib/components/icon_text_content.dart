import 'package:flutter/material.dart';
import '../constants.dart';

class IconTextContent extends StatelessWidget {
  const IconTextContent({required this.iconData, required this.text});

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
