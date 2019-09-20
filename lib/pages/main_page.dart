import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final Color primary = Color(0xff291747);
  final Color active = Color(0xff6C48AB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: active,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\t\t\tProgramação',
                  style: TextStyle(color: Colors.white, fontSize: 26.0),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: primary,
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                width: 400,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Coffee Break - 08:00 ~ 08:45',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\t\t\tMentoria',
                  style: TextStyle(color: Colors.white, fontSize: 26.0),
                ),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: primary,
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                width: 400,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Nenhuma mentoria agendada...\nConsulte a página de mentores.',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
