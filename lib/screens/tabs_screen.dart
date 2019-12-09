import 'package:DestekVer/services/locator.dart';
import 'package:DestekVer/services/page_service.dart';
import 'package:DestekVer/util/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/suggestions_screen.dart';
import '../screens/new_complain.dart';
import '../screens/complain_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/survey_select_screen.dart';
import 'package:DestekVer/search/custom_search_delegate.dart';
import '../provider/complains_provider.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final navKey = GlobalKey();

  final List<Widget> _pages = [
    ComplainScreen(searchBarComplainScreen: false,),
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
    final complainsData = Provider.of<ComplainsProvider>(context);

    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pageService.appBarTitles[pageService.selectedPage]),
          actions: <Widget>[
            if (locator<PageService>().selectedPage == 0)
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(complainsData.allComplains),
                  );
                },
              )
          ],
        ),
        body: getBody(),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          key: navKey,
          animationDuration: Duration(milliseconds: 200),
          color: Color.fromRGBO(76, 175, 80, 1),
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(
              Icons.message,
              size: 35,
              color: Colors.white,
            ),
            Icon(
              Icons.dehaze,
              color: Colors.white,
              size: 35,
            ),
            Icon(
              Icons.edit,
              size: 40,
              color: Colors.white,
            ),
            Icon(
              Icons.chat_bubble_outline,
              color: Colors.white,
              size: 35,
            ),
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
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
