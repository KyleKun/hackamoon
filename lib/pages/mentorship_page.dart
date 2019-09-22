import 'package:flutter/material.dart';
import 'package:hackamoon/utils/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

MyColors myColors = MyColors();
int mentorChoosed = 0;

Map mentorIndiana = {
  'id': 1,
  'requested': false,
};

Map mentorRobin = {
  'id': 2,
  'requested': false,
};

Map mentorBatman = {
  'id': 3,
  'requested': false,
};

Map mentorShrek = {
  'id': 4,
  'requested': false,
};

Map mentorET = {
  'id': 5,
  'requested': false,
};

class MentorshipPage extends StatefulWidget {
  @override
  _MentorshipPageState createState() => _MentorshipPageState();
}

class _MentorshipPageState extends State<MentorshipPage> {
  final String indiana = 'assets/indiana.jpg';
  final String robin = 'assets/robin.jpg';
  final String batman = 'assets/batman.jpg';
  final String shrek = 'assets/shrek.jpg';
  final String et = 'assets/et.jpg';

  static TextStyle btnStyle = new TextStyle(
      color: Colors.white, fontSize: 14.0, fontFamily: 'CaviarDreamsBold');



  String getButtonText(Map mentor) {
    if (mentor['requested'] == true) {
      return 'Cancelar';
    } else {
      return 'Requisitar';
    }
  }

  Color getButtonColor(Map mentor) {
    if (mentor['requested'] == true) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mentorCards(),
    );
  }

  void unableToRequest(){
    Alert(
      context: context,
      type: AlertType.info,
      title: 'Oops!',
      desc: 'Um mentor de cada vez! Espere ser atendido antes de requisitar outro xD',
      buttons: [
        DialogButton(
          color: Colors.green,
          width: 200.0,
          child: Text(
            'OK',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ).show();
  }

  void requestMentor(Map mentor) {
    if (mentor['requested']) {
      Alert(
        context: context,
        type: AlertType.warning,
        title: 'Cancelar Mentoria',
        desc: 'Deseja realmente cancelar o agendamento com este mentor?',
        buttons: [
          DialogButton(
            color: Colors.green,
            width: 100.0,
            child: Text(
              'SIM',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                mentor['requested'] = !mentor['requested'];
                mentorChoosed = 0;
              });
            },
          ),
          DialogButton(
              color: Colors.red,
              width: 100.0,
              child: Text(
                'CANCELAR',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.success,
        title: 'Mentoria Agendada!',
        desc: 'Consulte a página inicial para mais informações.',
        buttons: [
          DialogButton(
            color: Colors.green,
            width: 200.0,
            child: Text(
              'OK',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                mentor['requested'] = !mentor['requested'];
                mentorChoosed = mentor['id'];
              });
            },
          ),
        ],
      ).show();
    }
  }

  Widget mentorCards() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.active,
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\t\tMentores',
                  style: TextStyle(
                      fontFamily: 'CaviarDreamsBold',
                      color: Colors.white,
                      fontSize: 26.0),
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
              color: myColors.primary,
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
                          padding: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(indiana),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Text(
                              'Indiana Jones\nÁrea: Business',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                            color: getButtonColor(mentorIndiana),
                            child: new Text(
                              getButtonText(mentorIndiana),
                              style: btnStyle,
                            ),
                            onPressed: () {
                              if (mentorShrek['requested'] == true ||
                                  mentorRobin['requested'] == true ||
                                  mentorBatman['requested'] == true||
                                  mentorET['requested'] == true) {
                                unableToRequest();
                              } else {
                                setState(() {
                                  requestMentor(mentorIndiana);
                                });
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      width: 35.0,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('TODO');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: myColors.primary,
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
                          padding: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(robin),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Text(
                              'Robin Hood\nÁrea: UX/Design',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                            color: getButtonColor(mentorRobin),
                            child: new Text(
                              getButtonText(mentorRobin),
                              style: btnStyle,
                            ),
                            onPressed: () {
                              if (mentorIndiana['requested'] == true ||
                                  mentorShrek['requested'] == true ||
                                  mentorBatman['requested'] == true||
                                  mentorET['requested'] == true) {
                                unableToRequest();
                              } else {
                                setState(() {
                                  requestMentor(mentorRobin);
                                });
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('TODO');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: myColors.primary,
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
                          padding: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(batman),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Text(
                              'Bruce Wayne\nÁrea: Development',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                            color: getButtonColor(mentorBatman),
                            child: new Text(
                              getButtonText(mentorBatman),
                              style: btnStyle,
                            ),
                            onPressed: () {
                              if (mentorIndiana['requested'] == true ||
                                  mentorRobin['requested'] == true ||
                                  mentorET['requested'] == true||
                                  mentorShrek['requested'] == true) {
                                unableToRequest();
                              } else {
                                setState(() {
                                  requestMentor(mentorBatman);
                                });
                              }
                            }),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('TODO');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: myColors.primary,
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
                          padding: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(shrek),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Text(
                              'Shrek (Ogro)\nÁrea: Business',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                            color: getButtonColor(mentorShrek),
                            child: new Text(
                              getButtonText(mentorShrek),
                              style: btnStyle,
                            ),
                            onPressed: () {
                              if (mentorIndiana['requested'] == true ||
                                  mentorRobin['requested'] == true ||
                                  mentorBatman['requested'] == true||
                                  mentorET['requested'] == true) {
                                unableToRequest();
                              } else {
                                setState(() {
                                  requestMentor(mentorShrek);
                                });
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      width: 35.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('TODO');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                ),
              ),
              color: myColors.primary,
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
                          padding: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage(et),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 45.0),
                            child: Text(
                              'ET (Alien)\nÁrea: UX/Design',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        FlatButton(
                            color: getButtonColor(mentorET),
                            child: new Text(
                              getButtonText(mentorET),
                              style: btnStyle,
                            ),
                            onPressed: () {
                              if (mentorIndiana['requested'] == true ||
                                  mentorRobin['requested'] == true ||
                                  mentorBatman['requested'] == true||
                                  mentorShrek['requested'] == true){
                                unableToRequest();
                              } else {
                                setState(() {
                                  requestMentor(mentorET);
                                });
                              }
                            }),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                      height: 10.0,
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print('TODO');
                          },
                        )
                      ],
                    )
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
