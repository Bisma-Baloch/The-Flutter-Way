import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_flutter_way/models/tip_calculator_model.dart';
import 'package:the_flutter_way/screens/tip_calculator_screen.dart';

class CalculatorTipApp extends StatelessWidget {
  const CalculatorTipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TipCalculatorProvider(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.green),
          home: const CalculatorTipScreen(),
        ));
  }
}
