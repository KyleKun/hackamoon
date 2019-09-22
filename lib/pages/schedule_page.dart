import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:hackamoon/utils/colors.dart';

MyColors myColors = MyColors();

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSchedule(),
    );
  }

  Widget buildDivider() {
    return SizedBox(
      width: 10.0,
      height: 10.0,
    );
  }

  Widget buildCard(String text, String time, List<Color> colors) {
    Alignment alignmentStart = Alignment.topRight;
    Alignment alignmentEnd = Alignment.bottomLeft;

    return GradientCard(
      gradient: Gradients.buildGradient(alignmentStart, alignmentEnd, colors),
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
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  Text(
                    time,
                    style: TextStyle(color: myColors.text, fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSchedule() {
    return SingleChildScrollView(
      child: Container(
        color: myColors.active,
        child: Column(
          children: <Widget>[
            buildDivider(),
            Row(
              children: <Widget>[
                Text(
                  '\t\t\tSábado',
                  style: TextStyle(
                      fontFamily: 'CaviarDreamsBold',
                      color: Colors.white,
                      fontSize: 26.0),
                ),
              ],
            ),
            buildCard('Coffee Break', '08:00 - 08:45', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            buildCard('Desafios', '08:45 - 09:30', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Formação de Times', '09:30 - 09:45', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            buildCard('Brainstorming', '09:45 - 12:00', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Almoço', '12:00 - 13:00', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            buildCard('Desenvolvimento', '13:00 - 22:00', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Pizza Time', '22:00 - 23:59', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            Row(
              children: <Widget>[
                Text(
                  '\t\t\tDomingo',
                  style: TextStyle(
                      fontFamily: 'CaviarDreamsBold',
                      color: Colors.white,
                      fontSize: 26.0),
                ),
              ],
            ),
            buildCard('More Coding S2', '23:59 - 08:00', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Coffee Break', '08:00 - 08:45', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            buildCard('Pitch Training', '08:45 - 12:45', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Almoço', '12:45 - 14:00', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
            buildCard('Apresentações', '14:00 - 17:00', [
              myColors.accent,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.accent
            ]),
            buildDivider(),
            buildCard('Encerramento', '17:00 - 17:30', [
              myColors.text,
              myColors.active,
              myColors.active,
              myColors.primary,
              myColors.text
            ]),
            buildDivider(),
          ],
        ),
      ),
    );
  }
}
