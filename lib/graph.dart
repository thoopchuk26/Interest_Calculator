import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'calculator.dart';

class graph_display extends StatelessWidget{
  final String date;
  final double money;
  final charts.Color color;

  graph_display(this.date, this.money, Color color): this.color = new charts.Color(r: color.red, g: color.green, b: color.blue, a: color.alpha);

  @override
  Widget build(BuildContext context) {
    var data = Calculator.data;

    var series = [
      new charts.Series(
        id: 'Money',
        domainFn: (graph_display clickData, _) => clickData.date,
        measureFn: (graph_display clickData, _) => clickData.money,
        colorFn: (graph_display clickData, _) => clickData.color,
        data: data,
      ),
    ];
    var chart = charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = Padding(
      padding: EdgeInsets.all(32.0),
      child: SizedBox(
        height: 200.0,
        child: chart,
      ),
    );
    return Scaffold (
      appBar: AppBar(
        title: Text("Graph Display"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Investment Growth'
            ),
            chartWidget,
          ]
        ),
      ),
    );
  }
}
