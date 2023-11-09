import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _calculatorScreenState();
}

class _calculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0.0;
  double num2 = 0.0;
  double result = 0.0;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: _buildMainWidget(context),
    );
  }

  Widget _buildMainWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter First Number',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            onChanged: (value) {
              setState(() {
                num1 = double.parse(value);
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Enter Second Number',
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            onChanged: (value) {
              setState(() {
                num2 = double.parse(value);
              });
            },
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            TextButton(
              onPressed: () {
                setState(() {
                  calculator("+");
                });
              },
              child: Text("Add"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  calculator("-");
                });
              },
              child: Text("Subtract"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  calculator("*");
                });
              },
              child: Text("Multiply"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  calculator("/");
                });
              },
              child: Text("Divide"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          if (errorMessage.isNotEmpty)
            Text(
              errorMessage,
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Result: $result',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  void calculator(String operator) {
    if (num1 == 0.0 || num2 == 0.0) {
      setState(() {
        errorMessage = 'Please input numbers.';
      });
      return;
    }

    switch (operator) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num1 / num2;
        break;
      default:
        result = 0.0;
    }

    setState(() {
      errorMessage = '';
    });
  }
}
