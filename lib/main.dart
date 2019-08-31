import 'package:flutter/material.dart';

void main() => runApp(Hackamoon());

class Hackamoon extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hackamoon'), backgroundColor: Colors.teal.shade800,),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('2.5k dollars...'),
            ],
          ),
        ),
      ),
    );
 }
}