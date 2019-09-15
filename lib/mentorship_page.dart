import 'package:flutter/material.dart';

class MentorshipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text("Mentoria!"
              ) ,
            ),
          ),
         ),
         Expanded(
           child: FlatButton(
              color: Colors.teal,
              //textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(0),
              splashColor: Colors.blueAccent,
             onPressed: () {
               /*...*/
              },
            child: Text(
              "Agendar Mentoria",
            ),
            ),
          )
      ]
    );
  }
}
