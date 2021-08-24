import 'package:flutter/material.dart';
import '../constants.dart';

class GradientCard extends StatelessWidget {
  GradientCard({
    required this.colors,
    this.cardChild,
    this.opacity = 1.0,
    this.onPress,
  });

  final List<Color> colors;
  final Widget? cardChild;
  final double opacity;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Opacity(
        opacity: opacity,
        child: Container(
          child: cardChild,
          margin: EdgeInsets.all(kCardMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kCornerRadius),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}
