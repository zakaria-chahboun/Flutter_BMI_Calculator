import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foorthapp/result_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'my_widgets.dart';
import 'constants.dart';
import 'calculate_bmi.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  createState() => _InputPageState();
}

enum sexState { male, female }

class _InputPageState extends State<InputPage> {
  // selected state Type: male or female
  sexState selectedState;

  // Slider Value: Height of person :p
  int _sliderValueCounter = 120;

  // Proprties Value: Weight and age
  int humanWeight = 20;
  int humanAge = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /// First Col
          Expanded(
            child: Row(
              children: [
                // Left
                MyCard(
                  onPress: () {
                    setState(() {
                      selectedState = sexState.male;
                    });
                  },
                  color: selectedState == sexState.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    icon: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                ),
                // Right
                MyCard(
                  onPress: () {
                    setState(() {
                      selectedState = sexState.female;
                    });
                  },
                  color: selectedState == sexState.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  child: IconContent(
                    icon: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                ),
              ],
            ),
          ),

          /// Second Col
          MyCard(
            color: kActiveCardColor,
            child: Column(
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
                      "$_sliderValueCounter",
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainerColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      activeTrackColor: Colors.white,
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      overlayColor: Color(0x29EA114C),
                      valueIndicatorColor: Color(0xFFEA114C)),
                  child: Slider(
                    inactiveColor: Color(0xFF6A6E7B),
                    label: "$_sliderValueCounter",
                    value: _sliderValueCounter.toDouble(),
                    min: 100.0,
                    max: 220.0,
                    divisions: 100,
                    onChanged: (double newValue) {
                      setState(() {
                        _sliderValueCounter = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          /// Third Col
          Expanded(
            child: Row(
              children: [
                // Left
                MyCard(
                  color: kActiveCardColor,
                  child: PropContent(
                    lable: "WEIGHT",
                    number: humanWeight,
                    onMinusPress: () {
                      setState(() {
                        humanWeight <= 20 ? humanWeight : humanWeight--;
                      });
                    },
                    onPlusPress: () {
                      setState(() {
                        humanWeight >= 260 ? humanWeight : humanWeight++;
                      });
                    },
                  ),
                ),
                // Right
                MyCard(
                  color: kActiveCardColor,
                  child: PropContent(
                    lable: "AGE",
                    number: humanAge,
                    onMinusPress: () {
                      setState(() {
                        humanAge <= 10 ? humanAge : humanAge--;
                      });
                    },
                    onPlusPress: () {
                      setState(() {
                        humanAge >= 150 ? humanAge : humanAge++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // Bottom Button
          BottomButton(
            text: "CALCULATE YOUR BMI!",
            onTap: () {
              if (selectedState == null)
                Alert(
                        context: context,
                        title: "Selected Off!!",
                        desc: "Please choose your sex type")
                    .show();
              else {
                BmiCalculator calc = BmiCalculator(
                    height: this._sliderValueCounter, weight: this.humanWeight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmi: calc.bmiCalculate(),
                              result: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              }
            },
          ),
        ],
      ),
    );
  }
}
