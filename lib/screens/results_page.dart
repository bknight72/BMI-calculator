import 'package:bmi_ben/constants.dart';
import 'package:bmi_ben/components/gradient_card.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.numberBMI,
      required this.resultBMI,
      required this.interpretationBMI});

  final String numberBMI;
  final String resultBMI;
  final String interpretationBMI;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATED',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: kCardMargin, top: 60.0),
            child: Text(
              'Your Result',
              style: kNumberTextStyle,
            ),
          ),
          Expanded(
            child: GradientCard(
              colors: [kGradient3A, kGradient3B, kGradient3C],
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultBMI.toUpperCase(),
                    style: kWeightTextStyle,
                  ),
                  Text(
                    numberBMI,
                    style: kBigNumberTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      interpretationBMI,
                      style: kResultSmallTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () => Navigator.pop(context),
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
