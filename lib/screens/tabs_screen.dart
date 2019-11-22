import 'package:DestekVer/services/locator.dart';
import 'package:DestekVer/services/page_service.dart';
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

  final List<Widget> _pages = [
    ComplainScreen(),
    SurveySelectScreen(),
    NewComplain(),
    SuggestionsScreen(),
    ProfileScreen()
  ];

  Widget getBody() {
    return _pages[locator<PageService>().selectedPage];
  }

  @override
  Widget build(BuildContext context) {

    final pageService = locator<PageService>();

    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageService.appBarTitles[pageService.selectedPage]),
        ),
        drawer: locator<PageService>().selectedPage == 0 ? Drawer() : null,
        body: getBody(),
        bottomNavigationBar: CurvedNavigationBar(
          key: navKey,
          animationDuration: Duration(milliseconds: 200),
          color: Color.fromRGBO(76, 175, 80, 1),
          backgroundColor: Colors.transparent,
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
              Icons.edit,
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
              locator<PageService>().setPage(selectedPage);
            });
          },
        ),
      ),
    );
  }
}
