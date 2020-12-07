import 'package:interest_calculator/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interest_calculator/graph.dart';

void main() {
  test('Test get Rate of Investment', (){
    Calculator calc = new Calculator(10000.0,5.0,10.0,1000.0);
    calc.investmentRate = calc.calculateInvestmentRate("Quarterly");
    expect(calc.investmentRate,4.0);
  });
  test('Test Calculator Output', (){
    Calculator calc = new Calculator(10000.0,5.0,10.0,1000.0);
    calc.investmentRate = calc.calculateInvestmentRate("Annually");
    double expectedVal = 28866.84;
    double finalVal = calc.calculate(calc);
    double finalRound = double.parse((finalVal).toStringAsFixed(2));
    expect(finalRound,expectedVal);//Test that the final calculation is correctly equal to $28,866.84
  });
  test('Test Graph Output', (){
    Calculator calc = new Calculator(10000.0,5.0,0.0, 1000.0);
    calc.investmentRate = calc.calculateInvestmentRate("Annually");
    var data = [(graph_display('0 Yr.', 10000, Colors.red))];
    expect(Calculator.data.toString(),data.toString());//Test that values are accurately getting added to the graph builder
  });
}
