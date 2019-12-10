import 'package:DestekVer/search/default_app_bar.dart';
import 'package:DestekVer/services/locator.dart';
import 'package:DestekVer/services/page_service.dart';
import 'package:DestekVer/util/fancy_bottom_navigation.dart';
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
        appBar:
            DefaultAppBar(pageService.appBarTitles[pageService.selectedPage]),
        body: getBody(),
        bottomNavigationBar: FancyBottomNavigation(
          key: navKey,
          tabs: [
            TabData(iconData: Icons.message, title: "Şikayetler"),
            TabData(iconData: Icons.dehaze, title: "Anketler"),
            TabData(iconData: Icons.edit, title: "Ekle"),
            TabData(iconData: Icons.chat_bubble_outline, title: "Öneriler"),
            TabData(iconData: Icons.person, title: "Profilim"),
          ],
          onTabChangedListener: (int selectedPage) {
            setState(() {
              locator<PageService>().setPage(selectedPage);
            });
          },
        ),
      ),
    );
  }
}
