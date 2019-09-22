import 'package:flutter/material.dart';
import 'package:hackamoon/utils/colors.dart';
import 'package:hackamoon/utils/oval-right-clipper.dart';

MyColors myColors = MyColors();

class MenuTab {
  Widget createMenuTab() {
    return _buildDrawer();
  }

  Widget _buildRow(IconData icon, String title, Color iconColor) {
    final TextStyle tStyle = TextStyle(color: myColors.text, fontSize: 18.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: myColors.text,
    );
  }

  _buildDrawer() {
    final String teamImage = 'assets/image_team.jpg';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: myColors.primary,
            boxShadow: [BoxShadow(color: Colors.black54)]),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: myColors.text,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 700,
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage(teamImage),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Shawee Team',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontFamily: 'CaviarDreamsBold',
                          foreground: Paint()
                            ..style = PaintingStyle.fill
                            ..color = Colors.white,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildRow(Icons.all_inclusive, 'Desafio 1', Colors.blue),
                      _buildDivider(),
                      _buildRow(Icons.all_inclusive, 'Desafio 2', Colors.blue),
                      _buildDivider(),
                      _buildRow(Icons.star_border, 'Avaliar Hackathon',
                          myColors.accent),
                      _buildDivider(),
                      SizedBox(
                        height: 110.0,
                      ),
                      Text(
                        '                         Hackamoon© 2019',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          //SizedBox(height: 1.0),
        ),
      ),
    );
  }
}
