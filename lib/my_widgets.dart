import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

// Simple box .. 'Icon' on the top & 'Text' on the bottom (put inside MyCard)
class IconContent extends StatelessWidget {
  const IconContent({
    @required this.icon,
    @required this.text,
    Key key,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icon,
          size: 58,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          this.text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}

// MyCard : Simple expanded rounded box
class MyCard extends StatelessWidget {
  const MyCard({
    this.color,
    this.child,
    this.onPress,
    this.flex = 1,
    Key key,
  }) : super(key: key);

  final Widget child;
  final Color color;
  final int flex;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.flex,
      child: GestureDetector(
        onTap: this.onPress,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: this.color, borderRadius: BorderRadius.circular(10)),
            // we alredy have a default color from Matrrial -cardColor-
            child: this.child,
          ),
        ),
      ),
    );
  }
}

// Proprties Content: (lable + text or number + two circular buttons)
class PropContent extends StatelessWidget {
  const PropContent({
    this.lable,
    this.number,
    this.onMinusPress,
    this.onPlusPress,
    Key key,
  }) : super(key: key);

  final String lable;
  final int number;
  final Function onMinusPress;
  final Function onPlusPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // lable
        Text(
          this.lable,
          style: kLabelTextStyle,
        ),
        // number
        Text(
          this.number.toString(),
          style: kNumberTextStyle,
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Button Minus
            Expanded(
              child: SizedBox(
                height: 60,
                child: FlatButton(
                  shape: CircleBorder(),
                  onPressed: this.onMinusPress,
                  child: Icon(FontAwesomeIcons.minus),
                  color: Color(0x409499AB),
                ),
              ),
            ),
            // Button Plus
            Expanded(
              child: SizedBox(
                height: 60,
                child: FlatButton(
                  shape: CircleBorder(),
                  onPressed: this.onPlusPress,
                  child: Icon(FontAwesomeIcons.plus),
                  color: Color(0x409499AB),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}


// Floor: Bootom Button
class BottomButton extends StatelessWidget {
  const BottomButton({
    this.text,
    this.onTap,
    Key key,
  }) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
                letterSpacing: 2, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
