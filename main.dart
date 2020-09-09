import 'package:flutter/material.dart';
import 'package:interest_calculator/Calculator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Compound Interest Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String initialInv, additionalInv, growthRate, lengthofTime = '0',_dropDownValue = 'Annually';
  double investmentRate, finalValue = 0;

  void interestOutput() {
    setState(() {
      investmentRate = calculateinvestmentRate(_dropDownValue);
      Calculator output = new Calculator(double.parse(initialInv), double.parse(growthRate), double.parse(additionalInv), double.parse(lengthofTime), investmentRate);
      finalValue = output.calculate(output);
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  double calculateinvestmentRate(String rate){
    if(rate == 'Daily')
      return 365;
    if(rate == 'Weekly')
      return 52;
    if(rate == 'Monthly')
      return 12;
    if(rate == 'Quarterly')
      return 4;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Your investment after $lengthofTime years'
            ),
            Text(
              '$finalValue',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextField(
                onChanged: (text) {
                  initialInv  = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter initial investment')),
            TextField(
                onChanged: (text) {
                  additionalInv = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter consistent investment')),
            TextField(
                onChanged: (text) {
                  lengthofTime = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter length of time in years (Eg: 10 Years)')),
            TextField(
                onChanged: (text) {
                  growthRate = text;
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter expected growth rate (%)')),
            DropdownButton<String>(
                value: _dropDownValue,
                items: <String>['Annually', 'Quarterly', 'Monthly', 'Weekly', 'Daily'].map<DropdownMenuItem<String>>((String value) {
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: interestOutput,
        tooltip: 'Start Buttone',
        child: Icon(Icons.arrow_forward),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
