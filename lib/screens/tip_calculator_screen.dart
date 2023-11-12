import 'package:flutter/material.dart';

class CalculatorTipScreen extends StatefulWidget {
  @override
  State<CalculatorTipScreen> createState() => _CalculatorTipScreenState();
}

class _CalculatorTipScreenState extends State<CalculatorTipScreen> {
  double tipPercentage = 0;
  double billAmount = 0;
  double tipAmount = 0;
  double totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tip Calculator')),
      body: _buildMainWidget(context),
    );
  }

  Widget _buildMainWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Enter The Bill Amount"),
          SizedBox(
            height: 8,
          ),
          TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  billAmount = double.parse(value);
                });
              }),
          SizedBox(
            height: 20,
          ),
          Text("Select Tip percentage:"),
          Slider(
              value: tipPercentage,
              max: 30,
              divisions: 10,
              label: '${tipPercentage.toInt()}%',
              onChanged: (double value) {
                setState(() {
                  tipPercentage = value;
                  calculateTipAmount();
                });
              }),
          SizedBox(height: 20),
          Text("Tip PKR: ${tipAmount.toStringAsFixed(2)}"),
          Text("Tip PKR: ${totalAmount.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  void calculateTipAmount() {
    tipAmount = (billAmount * tipPercentage) / 100;
    totalAmount = billAmount + tipAmount;
  }
}
