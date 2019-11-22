import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/util/utils.dart';
import 'package:DestekVer/widget/complain_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  Widget buildList({
    List<Complain> complains,
    bool unresolved = false,
    bool replied = false,
    bool solved = false,
  }) {
    List<Complain> filteredComplains = complains.where((comp) {
      if (replied) {
        return comp.replied;
      } else if (solved) {
        return comp.solved;
      } else {
        return !comp.replied && !comp.solved;
      }
    }).toList();
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ComplainItem(
          filteredComplains[index],
        );
      },
      itemCount: filteredComplains.length,
    );
  }

  Widget buildScreen({
    List<Complain> complain,
    String username,
    BuildContext context,
    bool solved = false,
    bool replied = false,
  }) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                child: Icon(
                  Icons.account_circle,
                  size: screenSize(70, context),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                username,
                style: TextStyle(
                  fontSize: screenSize(18, context),
                ),
              ),
            ),
            SizedBox(
              width: screenSize(70, context),
            ),
            Row(
              children: <Widget>[
                Text(
                  ' 5',
                  style: TextStyle(fontSize: screenSize(20, context)),
                ),
                Stack(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: screenSize(30, context),
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.black87,
                      size: screenSize(30, context),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        Divider(
          thickness: 4,
        ),
        Expanded(
            child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: TabBar(
              indicatorColor: Colors.green,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Tüm Şikayetler",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenSize(12.5, context),
                    ),
                  ),
                ),
                Tab(
                    child: Text(
                  'Cevaplananlar',
                  style: TextStyle(
                    color: Colors.yellow[900],
                    fontSize: screenSize(12.5, context),
                  ),
                )),
                Tab(
                  child: Text(
                    "Çözülenler",
                    style: TextStyle(
                      color: Color(0xff00681D),
                      fontSize: screenSize(12.5, context),
                    ),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                buildList(complains: complain,unresolved: true),
                buildList(complains: complain, replied: true),
                buildList(complains: complain, solved: true),
              ],
            ),
          ),
        )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Complain> complains =
        Provider.of<ComplainsProvider>(context).allComplains;

    List<Complain> personsComplains = complains.where((comp) {
      print(comp.username);
      return comp.username.toLowerCase() == "ahmet a.";
    }).toList();

    return buildScreen(
      complain: personsComplains,
      username: 'Ahmet Akıl',
      context: context,
    );
  }
}
