import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  //debugPaintLayerBordersEnabled = true;
  //debugPaintBaselinesEnabled = true;
  runApp(MaterialApp(
    home: InputPage(),
    // Global theme of this App!
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0d101f),
      scaffoldBackgroundColor: Color(0xFF0d101f),
      cardColor: Color(0xFF1b1c2c),
    ),
  ));
}
