import 'dart:math';
import 'package:flutter/material.dart';
import 'graph.dart';

class Calculator {
  double principle, interestRate, lengthofTime, investmentRate, annualInvestment;
  static var data;

  Calculator(initialInvestment, growthRate, timeinYears, additionalInvestment) {
    this.principle = initialInvestment;
    this.interestRate = growthRate / 100;
    this.lengthofTime = timeinYears;
    this.annualInvestment = additionalInvestment;
    data = [(graph_display('0 Yr.', principle, Colors.red))];
  }

  double calculate(Calculator invest) {
    for(int i = 1; i <= lengthofTime; i++) {
      principle = principle * pow((1 + (interestRate / investmentRate)), (investmentRate * 1));
      principle += annualInvestment;
      data += [(graph_display('$i Yr.', principle, Colors.red))];
    }
    return principle;
  }

  double calculateInvestmentRate(String rate) {
    if (rate == 'Daily')
      return 365;
    if (rate == 'Weekly')
      return 52;
    if (rate == 'Monthly')
      return 12;
    if (rate == 'Quarterly')
      return 4;
    return 1;
  }
}
