import 'package:flutter/material.dart';
import 'package:interest_calculator/graph.dart';
import 'calculator.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialInv,
      growthRate,
      lengthofTime = '0',
      _dropDownValue = 'Annually',
      annualAddition;
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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter initial investment value (Eg: (\$)1000)')),
            TextField(
                onChanged: (text) {
                  annualAddition = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter annual addition to investment (Eg. (\$)100)')),
            TextField(
                onChanged: (text) {
                  lengthofTime = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter length of time in years (Eg: 10 (Years))')),
            TextField(
                onChanged: (text) {
                  growthRate = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter expected growth rate (Eg: 5(%))')),
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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => graph_display())),
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