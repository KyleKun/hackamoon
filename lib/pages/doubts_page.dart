import 'package:flutter/material.dart';
import 'package:hackamoon/utils/colors.dart';
import 'package:hackamoon/utils/text_data.dart';

MyColors myColors = MyColors();

TextData textData = TextData();

class DoubtsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColors.active,
      child: Column(children: <Widget>[
        SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '\t\tInstruções de submissão',
              style: TextStyle(
                  fontFamily: 'CaviarDreamsBold',
                  color: myColors.text,
                  fontSize: 24.0
              ),
            ),
          ],
        ),
        SizedBox(height: 15.0),
        new Expanded(
          flex: 1,
          child: new SingleChildScrollView(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: new Text(
              textData.schedule,
              style: TextStyle(
                fontSize: 14.0,
                color: myColors.text,
              ),
            ),
          ),
        ),

      ]),
    );
  }
}
