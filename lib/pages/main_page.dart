import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hackamoon/utils/colors.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:hackamoon/pages/mentorship_page.dart';
import 'dart:math';

MyColors myColors = MyColors();
MentorshipPage mentors = MentorshipPage();


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  static var random = Random();
  static var numberLeft = random.nextInt(5)+2;

  List mentor = ['Nenhuma mentoria agendada...\nConsulte a página de mentores.',
  '- Manda Chuva (Business)\nFaltam $numberLeft times antes da sua vez =]',
  '- Kaori (UX/Design)\nFaltam $numberLeft times antes da sua vez =]',
  '- Bruce Wayne (Development)\nFaltam $numberLeft times antes da sua vez =]',
  '- Shrek (Business)\nFaltam $numberLeft times antes da sua vez =]',
  '- ET (Alien) (UX/Design)\nFaltam $numberLeft times antes da sua vez =]'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: myColors.active,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\t\t\tProgramação',
                  style: TextStyle(
                      fontFamily: 'CaviarDreamsBold',
                      color: Colors.white,
                      fontSize: 26.0),
                ),
              ],
            ),
            GradientCard(
              gradient: Gradients.buildGradient(
                  Alignment.topLeft, Alignment.bottomRight, [
                myColors.text,
                myColors.active,
                myColors.active,
                myColors.primary,
                myColors.text
              ]),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Container(
                width: 300,
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Coffee Break',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          Text(
                            '08:00 - 08:45',
                            style:
                                TextStyle(color: myColors.text, fontSize: 20.0),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 80.0, top: 42.0),
                            child: Text(
                              'Próximo: Apresentação dos Desafios',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        mentor[mentorChoosed],
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                            fontSize: 18.0),
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
