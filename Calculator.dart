import 'dart:math';

class Calculator {

  double principle, interestRate, investments, lengthofTime, investmentRate;

  Calculator(initialInvestment, growthRate, additionalInvestment, timeinYears, additionalRate){
    this.principle = initialInvestment;
    this.interestRate = growthRate/100;
    this.investments = additionalInvestment;
    this.lengthofTime = timeinYears;
    this.investmentRate = additionalRate;
  }

  double calculate(Calculator invest){
    double finalNum = 0;
    for(int i = 0; i < invest.lengthofTime; i++) {
      invest.principle += (invest.investments * invest.investmentRate);
      finalNum = invest.principle * pow(1 + (invest.interestRate / 1), 1 * 1);
      invest.principle += (finalNum - invest.principle);
    }
    return finalNum;
  }
}