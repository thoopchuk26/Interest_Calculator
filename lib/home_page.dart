import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interest_calculator/graph.dart';
import 'calculator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialInv, growthRate, lengthofTime = '0', _dropDownValue = 'Annually', annualAddition;
  double finalValue = 0;

  void interestOutput() {
    setState(() {
      Calculator output = new Calculator(double.parse(initialInv),
          double.parse(growthRate), double.parse(lengthofTime),
          double.parse(annualAddition));
      output.investmentRate = output.calculateInvestmentRate(_dropDownValue);
      finalValue = output.calculate(output);
      finalValue = double.parse((finalValue).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Compounding Interest Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your investment after $lengthofTime years'),
            Text(
              '\$$finalValue',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            TextField(
                onChanged: (text) {
                  initialInv = text;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  new BlacklistingTextInputFormatter(new RegExp('[\\,|\\-]')),
                ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter initial investment value (Eg: (\$)1000.00)')),
            TextField(
                onChanged: (text) {
                  annualAddition = text;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  new BlacklistingTextInputFormatter(new RegExp('[\\,|\\-]')),
                ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter annual addition to investment (Eg. (\$)100.00)')),
            TextField(
                onChanged: (text) {
                  lengthofTime = text;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  new BlacklistingTextInputFormatter(new RegExp('[\\,|\\-]')),
                ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter length of time in years (Eg: 10 (Years))')),
            TextField(
                onChanged: (text) {
                  growthRate = text;
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  new BlacklistingTextInputFormatter(new RegExp('[\\,|\\-]')),
                ],
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter expected growth rate (Eg: 5.7(%))')),
            DropdownButton<String>(
                value: _dropDownValue,
                items: <String>[
                  'Annually',
                  'Quarterly',
                  'Monthly',
                  'Weekly',
                  'Daily'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String value) {
                  setState(() {
                    _dropDownValue = value;
                  });
                }),
            FloatingActionButton(
              heroTag: 'interestBtn',
              onPressed: interestOutput,
              tooltip: 'Start Button',
              child: Icon(Icons.attach_money),
            ),
            FloatingActionButton(
              heroTag: 'graphBtn',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => graph_display('0', 0, Colors.red))),
              tooltip: 'Graph Button',
              child: Icon(Icons.assessment),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}