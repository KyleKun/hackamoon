import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackamoon/pages/mentorship_page.dart';
import 'package:hackamoon/pages/menu_tab.dart';
import 'package:hackamoon/pages/schedule_page.dart';
import 'package:hackamoon/pages/doubts_page.dart';
import 'package:hackamoon/pages/instructions_page.dart';
import 'package:hackamoon/pages/main_page.dart';
import 'package:hackamoon/utils/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'dart:io';

MyColors myColors = MyColors();
MenuTab menuTab = MenuTab();

void main() => runApp(Hackamoon());

class Hackamoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomeScreen(),
      theme: ThemeData(fontFamily: 'CaviarDreams'),
    );
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
        title: Text(
          'Hackamoon',
          style: TextStyle(fontFamily: 'CaviarDreamsBold'),
        ),
        centerTitle: true,
        backgroundColor: myColors.primary,
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      drawer: menuTab.createMenuTab(),
      body: Container(
        child: _showPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: myColors.primary,
        backgroundColor: myColors.active,
        animationCurve: Curves.easeInOut,
        items: <Widget>[
          Icon(
            Icons.assignment,
            color: Colors.white,
          ),
          Icon(
            Icons.access_time,
            color: Colors.white,
          ),
          Icon(
            Icons.apps,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            color: Colors.white,
          ),
          Icon(
            Icons.help,
            color: Colors.white,
          )
        ],
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == Constants.Organization) {
      Alert(
        context: context,
        type: AlertType.info,
        title: 'Organização',
        desc: 'PATROCINADORES\n- Nasa\n- Faustão\n- Zoobomafoo\n\n'
            'APOIO\n- Turma da Mônica\n\n'
            'REALIZAÇÃO\n- República Federativa Russa',
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
    } else if (choice == Constants.About) {
      Alert(
        context: context,
        type: AlertType.none,
        title: 'Desenvolvedores',
        desc: 'Caio Pedroso\n(github.com/KyleKun)\n\n'
              'Emerson Silva\n(github.com/eps364)\n\n'
              'Gabriel Oliveira\n(github.com/Bluemarino)',
        buttons: [
          DialogButton(
            color: Colors.green,
            width: 200.0,
            child: Text(
              r'\(*v*)/',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ).show();

    } else if (choice == Constants.Exit) {
      exit(0);
    }
  }
}

class Constants {
  static const String Organization = 'Organização';
  static const String About = 'Sobre';
  static const String Exit = 'Sair';

  static const List<String> choices = <String>[Organization, About, Exit];
}
