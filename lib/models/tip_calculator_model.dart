import 'package:flutter/material.dart';

class TipCalculatorProvider extends ChangeNotifier {
  double tipPercentage = 0;
  double billAmount = 0;
  double tipAmount = 0;
  double totalAmount = 0;

  void setBillAmount(double amount) {
    billAmount = amount;
    calculateTipAmount();
    notifyListeners();
  }

  void setTipPercentage(double percentage) {
    tipPercentage = percentage;
    calculateTipAmount();
    notifyListeners();
  }

  void calculateTipAmount() {
    tipAmount = (billAmount * tipPercentage) / 100;
    totalAmount = billAmount + tipAmount;
  }
}
