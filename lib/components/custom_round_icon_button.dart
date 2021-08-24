import 'package:flutter/material.dart';

class CustomRoundIconButton extends StatelessWidget {
  const CustomRoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      shape: CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
      fillColor: Colors.white.withAlpha(300),
      highlightColor: Colors.white,
      highlightElevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
