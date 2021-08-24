import 'package:bmi_ben/calculator.dart';
import 'package:bmi_ben/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/gradient_card.dart';
import '../components/icon_text_content.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/custom_round_icon_button.dart';

enum Buttons {
  tractor,
  anchor,
  none,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Buttons selectedButton = Buttons.none;
  int height = 180;
  int weight = 80;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BEN\'S BMI CALCULATOR'),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GradientCard(
                    onPress: () {
                      setState(() {
                        selectedButton = Buttons.tractor;
                      });
                    },
                    colors: [kGradient1A, kGradient1B],
                    cardChild: IconTextContent(
                      iconData: Icons.agriculture_outlined,
                      text: "COOL CAR",
                    ),
                    opacity: selectedButton == Buttons.tractor
                        ? kFullOpacity
                        : kHalfOpacity,
                  ),
                ),
                Expanded(
                  child: GradientCard(
                    onPress: () {
                      setState(() {
                        selectedButton = Buttons.anchor;
                      });
                    },
                    colors: [kGradient2A, kGradient2B],
                    cardChild: IconTextContent(
                      iconData: Icons.anchor_rounded,
                      text: "SEA STOPPER",
                    ),
                    opacity: selectedButton == Buttons.anchor
                        ? kFullOpacity
                        : kHalfOpacity,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GradientCard(
              colors: [kGradient3A, kGradient3B, kGradient3C],
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        '  cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey[600],
                      trackHeight: 0.5,
                      thumbColor: kBottomBarColor,
                      overlayColor: kBottomBarColor.withAlpha(29),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                        elevation: 0.0,
                        pressedElevation: 0.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GradientCard(
                    colors: [kGradient4A, kGradient4B],
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' kg',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            CustomRoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GradientCard(
                    colors: [kGradient5A, kGradient5B],
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              ' yrs',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomRoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            CustomRoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    numberBMI: calc.getBMI(),
                    resultBMI: calc.getResult(),
                    interpretationBMI: calc.getInterpretation(),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
