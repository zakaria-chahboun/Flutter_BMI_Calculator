import 'package:flutter/material.dart';
import 'constants.dart';
import 'my_widgets.dart' show MyCard, BottomButton;

class ResultPage extends StatefulWidget {
  ResultPage({
    @required this.bmi,
    @required this.result,
    @required this.interpretation,
  });

  final String bmi;
  final String result;
  final String interpretation;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Title
            Expanded(
              child: Container(
                padding: EdgeInsets.all(18),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Result",
                  style: kNumberTextStyle,
                ),
              ),
            ),
            // Body Result (Alredy have an 'Expanded' parent, So the 'Flex' can work fine)
            MyCard(
              flex: 5,
              color: kActiveCardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.result.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                        fontSize: 16),
                  ),
                  Text(
                    widget.bmi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.interpretation,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
            // Footer Button
            // Bottom Button
            BottomButton(
              text: "RE-CALCULATE!",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
