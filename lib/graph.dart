import 'package:flutter/material.dart';

class graph_display extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Graph Display"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'This is where a graph would be if I knew how to make one'
            ),
            FloatingActionButton(
              child: Icon(Icons.check),
              onPressed:() => Navigator.pop(context),
            ),
          ]
        ),
      ),
    );
  }
}
