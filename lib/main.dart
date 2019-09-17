import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackamoon/mentorship_page.dart';
import 'package:hackamoon/schedule_page.dart';
import 'package:hackamoon/doubts_page.dart';
import 'package:hackamoon/instructions_page.dart';
import 'package:hackamoon/main_page.dart';
import 'package:hackamoon/oval-right-clipper.dart';

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

  Widget _buildRow(IconData icon, String title){
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Icon(icon, color: active,),
        SizedBox(width: 10.0),
        Text(title, style: tStyle,),
      ]),
    );
  }

  Divider _buildDivider(){
    return Divider(
        color: active,
    );
  }

  _buildDrawer(){
    final String teamImage = 'assets/image_team.jpg';
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
          color: primary,
          boxShadow: [
            BoxShadow(color: Colors.black54)
          ]
        ),
        width: 300,

        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.info_outline, color: active,),
                    onPressed: (){},
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                      LinearGradient(colors: [Colors.deepPurple, Colors.black54])),
                  child: CircleAvatar(
                  radius: 40,
                    backgroundImage: AssetImage(teamImage),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Time 123',
                  //TODO style: ,
                ),
                SizedBox(height: 30.0),
                _buildRow(Icons.all_inclusive, 'Desafio 1'),
                _buildDivider(),
                _buildRow(Icons.all_inclusive, 'Desafio 2'),
                _buildDivider(),
                _buildRow(Icons.star_border, 'Avaliar Hackathon'),
                _buildDivider(),
              ],
            ),
          ),
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
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.people),
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
        color: Colors.white,
        backgroundColor: Colors.teal,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(Icons.assignment),
          Icon(Icons.access_time),
          Icon(Icons.apps),
          Icon(Icons.people),
          Icon(Icons.help)
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
