import 'package:flutter/material.dart';
import 'package:the_flutter_way/screens/calculator_screen.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: CalculatorScreen());
  }
}
