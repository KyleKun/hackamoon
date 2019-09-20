import 'package:flutter/material.dart';

class MentorshipPage extends StatefulWidget {
  @override
  _MentorshipPageState createState() => _MentorshipPageState();
}

class _MentorshipPageState extends State<MentorshipPage> {
  final Color primary = Color(0xff291747);
  final Color active = Color(0xff6C48AB);
  final String teamImage = 'assets/image_team.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: active,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\t\tMentores',
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
                  children: <Widget>[
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(teamImage),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20.0, height: 10.0,),
                    Center(
                      child: Text(
                        'Indiana Jones\nÁrea: Negócios',
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
