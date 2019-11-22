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
          actions: <Widget>[
            if (locator<PageService>().selectedPage == 0)
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      context: context,
                      builder: (BuildContext ctx) => Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Text(
                                        "Filtreler",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      FlatButton(
                                        child: Text(
                                          "UYGULA",
                                          style: TextStyle(
                                              color: Colors.amber[800]),
                                        ),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.alarm),
                                      SizedBox(width: 7),
                                      Text(
                                        "Zamana göre Filtrele",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.add_location),
                                      SizedBox(width: 7),
                                      Text(
                                        "Konuma göre Filtrele",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.filter_hdr),
                                      SizedBox(width: 7),
                                      Text(
                                        "Müdürlüğe göre Filtrele",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                },
              )
          ],
        ),
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
