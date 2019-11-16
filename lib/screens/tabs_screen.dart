import 'package:demo_app1/screens/survey_screen.dart';
import 'package:flutter/material.dart';

import '../screens/complain_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/survey_select_screen.dart';

class TabsScreen extends StatelessWidget {
  final List<Widget> _pages = [
    ComplainScreen(),
    SurveySelectScreen(),
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
            Tab(
              icon: Icon(Icons.comment),
              text: "Şikayetler",
            ),
            Tab(
              icon: Icon(Icons.comment),
              text: "Anketler",
            ),
            Tab(icon: Icon(Icons.account_circle), text: "Profil"),
          ],
        ),
      ),
    );
  }
}
