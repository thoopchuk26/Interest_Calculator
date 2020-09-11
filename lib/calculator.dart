import 'dart:math';

class Calculator {
  double principle, interestRate, lengthofTime, investmentRate, annualInvestment;

  Calculator(initialInvestment, growthRate, timeinYears, additionalInvestment) {
    this.principle = initialInvestment;
    this.interestRate = growthRate / 100;
    this.lengthofTime = timeinYears;
    this.annualInvestment = additionalInvestment;
  }

  double calculate(Calculator invest) {
    for(int i = 0; i < lengthofTime; i++) {
      principle = principle * pow((1 + (interestRate / investmentRate)), (investmentRate * 1));
      principle += annualInvestment;
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
