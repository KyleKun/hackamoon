import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackamoon/pages/mentorship_page.dart';
import 'package:hackamoon/pages/schedule_page.dart';
import 'package:hackamoon/pages/doubts_page.dart';
import 'package:hackamoon/pages/instructions_page.dart';
import 'package:hackamoon/pages/main_page.dart';
import 'package:hackamoon/utils/oval-right-clipper.dart';

void main() => runApp(Hackamoon());

class Hackamoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 2;

  final Color primary = Color(0xff291747);
  final Color active = Color(0xff6C48AB);

  final InstructionsPage _instructions = new InstructionsPage();
  final SchedulePage _schedule = new SchedulePage();
  final MainPage _main = MainPage();
  final MentorshipPage _mentorship = new MentorshipPage();
  final DoubtsPage _doubts = new DoubtsPage();

  Widget _showPage = new MainPage();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _instructions;
        break;
      case 1:
        return _schedule;
        break;
      case 2:
        return _main;
        break;
      case 3:
        return _mentorship;
        break;
      case 4:
        return _doubts;
        break;
      default:
        return new Container(
          child: Center(
            child: Text('No Page Found!'),
          ),
        );
    }
  }

  Widget _buildRow(IconData icon, String title, Color iconColor) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 18.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
      ]),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: active,
    );
  }

  _buildDrawer() {
    final String teamImage = 'assets/image_team.jpg';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: primary, boxShadow: [BoxShadow(color: Colors.black54)]),
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
                    color: Colors.purple[500],
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
                    SizedBox(height: 15.0,),
                    Text(
                      'Time 123',
                      style: TextStyle(
                          fontSize: 26.0,
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
                    _buildRow(Icons.star_border, 'Avaliar Hackathon', Colors.yellow[800]),
                    _buildDivider(),
                    SizedBox(height: 110.0,),
                    Text(
                      '                         Hackamoon© 2019',
                      style: TextStyle(color: Colors.purple[500]),
                    )
                  ],
                ),
              ),
            ],
          )),
          //SizedBox(height: 1.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Hackamoon'),
        centerTitle: true,
        backgroundColor: primary,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              //TODO
              print(
                  'Lista de todos os organizadores, mentores e patrocinadores');
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Container(
        child: _showPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: primary,
        backgroundColor: active,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(Icons.assignment, color: Colors.white,),
          Icon(Icons.access_time, color: Colors.white,),
          Icon(Icons.apps, color: Colors.white,),
          Icon(Icons.people, color: Colors.white,),
          Icon(Icons.help, color: Colors.white,)
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }
}
