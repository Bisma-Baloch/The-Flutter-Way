import 'package:flutter/material.dart';
import 'package:the_flutter_way/screens/tip_calculator_screen.dart';

class CalculatorTipApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: CalculatorTipScreen(),
    );
  }
}
