import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
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
              color: primary,
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Padding(
                padding: EdgeInsets.all(70.0),
                child: Row(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Coffee Break - 08:00 ~ 08:45',
                        style: TextStyle(color: Colors.white,fontSize: 14.0),

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
