import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/suggestions_screen.dart';
import '../screens/new_complain.dart';
import '../screens/complain_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/survey_select_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final navKey = GlobalKey();

  int _selectedPage = 0;

  final List<Widget> _pages = [
    ComplainScreen(),
    SurveySelectScreen(),
    NewComplain(),
    SuggestionsScreen(),
    ProfileScreen()
  ];

  Widget getBody() {
    return _pages[_selectedPage];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('DestekVer'),
        ),
        body: getBody(),
        bottomNavigationBar: CurvedNavigationBar(
          key: navKey,
          animationDuration: Duration(milliseconds: 200),
          color: Colors.green,
          backgroundColor: Colors.white,
          items: <Widget>[
            Icon(
              Icons.message,
              color: Colors.white,
            ),
            Icon(
              Icons.dehaze,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle_outline,
              size: 32,
              color: Colors.white,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
            ),
          ],
          onTap: (int selectedPage) {
            setState(() {
              _selectedPage = selectedPage;
            });
          },
        ),
      ),
    );
  }
}
