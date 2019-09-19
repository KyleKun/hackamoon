import 'package:flutter/material.dart';


class MentorshipPage extends StatefulWidget {
  @override
  _MentorshipPageState createState() => _MentorshipPageState();
}

class _MentorshipPageState extends State<MentorshipPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: Center(
              child: Text("Dashboard"),
            ),
          ),
          Expanded(
            child: Text("Desenvolvimento"),
          ),
          Expanded(
            child: Center(
              child: Text("Mentoria"),
            ),
          ),
          Expanded(
            child: flatButton,
          )
        ]);
  }

  FlatButton flatButton = FlatButton(
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
  );
}

//class MentorshipPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        children: <Widget>[
//          Expanded(
//            flex: 0,
//            child: Center(
//              child: Text("Dashboard"),
//            ),
//          ),
//          Expanded(
//            child: Text("Desenvolvimento"),
//          ),
//          Expanded(
//            child: Center(
//              child: Text("Mentoria"),
//            ),
//          ),
//          Expanded(
//            child: flatButton,
//          )
//        ]);
//  }
//
//  FlatButton flatButton = FlatButton(
//    color: Colors.teal,
//    //textColor: Colors.white,
//    disabledColor: Colors.grey,
//    disabledTextColor: Colors.black,
//    padding: EdgeInsets.all(0),
//    splashColor: Colors.blueAccent,
//    onPressed: () {
//      /*...*/
//    },
//    child: Text(
//      "Agendar Mentoria",
//    ),
//  );
//}
