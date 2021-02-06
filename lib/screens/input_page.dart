import 'package:bmi_flutter/calculator_brain.dart';
import 'package:bmi_flutter/components/reausable_card.dart';
import 'package:bmi_flutter/components/reausable_icon.dart';
import 'package:bmi_flutter/screens/resuts_page.dart';
import 'package:bmi_flutter/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/botton_button.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          //stay tuned with this aligment
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.male
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        ReausableIcon(FontAwesomeIcons.mars, 'MALE'), () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    }),
                  ),
                  Expanded(
                    child: ReusableCard(
                        selectedGender == Gender.female
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        ReausableIcon(FontAwesomeIcons.venus, 'FEMALE'), () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard.colorChild(
                  KActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: KNumberTextStyle,
                          ),
                          Text(
                            'cm',
                            style: KLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0xFFEB1555),
                            thumbColor: Color(0xFFEB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderThumbShape(
                                enabledThumbRadius: 16.0)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard.colorChild(
                      KActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  weight++;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  weight--;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard.colorChild(
                      KActiveCardColor,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: KLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(FontAwesomeIcons.plus, () {
                                setState(() {
                                  age++;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(FontAwesomeIcons.minus, () {
                                setState(() {
                                  age--;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottonButton(() {
              
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    calc.calculateBMI(),
                    calc.getResult(),
                    calc.getInterpretation()
                  )));
            }, 'CALCULATE')
          ],
        ));
  }
}

