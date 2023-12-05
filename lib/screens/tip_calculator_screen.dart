import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_flutter_way/models/tip_calculator_model.dart';

class CalculatorTipScreen extends StatefulWidget {
  const CalculatorTipScreen({super.key});

  @override
  State<CalculatorTipScreen> createState() => _CalculatorTipScreenState();
}

class _CalculatorTipScreenState extends State<CalculatorTipScreen> {
  @override
  Widget build(BuildContext context) {
    TipCalculatorProvider tipProvider =
        Provider.of<TipCalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tip Calculator')),
      body: _buildMainWidget(context, tipProvider),
    );
  }

  Widget _buildMainWidget(
      BuildContext context, TipCalculatorProvider tipProvider) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text("Enter The Bill Amount"),
          const SizedBox(
            height: 8,
          ),
          TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  tipProvider.setBillAmount(double.parse(value));
                });
              }),
          const SizedBox(
            height: 20,
          ),
          const Text("Select Tip percentage:"),
          Slider(
              value: tipProvider.tipPercentage,
              max: 30,
              divisions: 10,
              label: '${tipProvider.tipPercentage.toInt()}%',
              onChanged: (double value) {
                tipProvider.setTipPercentage(value);
              }),
          const SizedBox(height: 20),
          Text("Tip PKR: ${tipProvider.tipAmount.toStringAsFixed(2)}"),
          Text("Total PKR: ${tipProvider.totalAmount.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}
