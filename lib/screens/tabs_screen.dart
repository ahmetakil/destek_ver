import 'package:demo_app1/screens/survey_screen.dart';
import 'package:flutter/material.dart';

import '../screens/complain_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/survey_select_screen.dart';

class TabsScreen extends StatelessWidget {
  final List<Widget> _pages = [
    ComplainScreen(),
<<<<<<< HEAD
    SurveySelectScreen(),
=======
    SurveyScreen(),
>>>>>>> 1cb90027d53dbbfca21b239ec15b011bf0b1d16c
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('DestekVer'),
        ),
        body: TabBarView(
          children: _pages,
        ),
        bottomNavigationBar: TabBar(
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          tabs: <Widget>[
<<<<<<< HEAD
            Tab(
              icon: Icon(Icons.comment),
              text: "Şikayetler",
            ),
            Tab(
              icon: Icon(Icons.comment),
              text: "Anketler",
            ),
            Tab(icon: Icon(Icons.account_circle), text: "Profil"),
=======
            Tab(icon: Icon(Icons.comment),text: "Şikayetler",),
            Tab(icon: Icon(Icons.comment),text: "Anketler",),
            Tab(icon: Icon(Icons.account_circle),text:"Profil"),
>>>>>>> 1cb90027d53dbbfca21b239ec15b011bf0b1d16c
          ],
        ),
      ),
    );
  }
}
