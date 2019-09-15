import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackamoon/mentorship_page.dart';
import 'package:hackamoon/schedule_page.dart';
import 'package:hackamoon/doubts_page.dart';
import 'package:hackamoon/instructions_page.dart';
import 'package:hackamoon/main_page.dart';

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
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Time 123'),
              accountEmail: null,
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.yellow,
              ),
            ),
            new ListTile(
              title: new Text('Desafio 1'),
              onTap: () {
                print('TODO');
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Desafio 2'),
              onTap: () {
                print('TODO');
              },
            ),
            new Divider(
              color: Colors.black,
              height: 5.0,
            ),
            new ListTile(
              title: new Text('Avaliar Hackathon'),
              onTap: () {
                print('TODO');
              },
            ),
          ],
        ),
      ),
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
