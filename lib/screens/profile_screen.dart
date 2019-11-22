import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/util/utils.dart';
import 'package:DestekVer/widget/complain_item.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    bool all = false,
  }) {
    List<Complain> filteredComplains = complains.where((comp) {
      if (all) {
        return true;
      }else if (solved) {
        return comp.solved;
      }
      else if (replied && !comp.solved) {
        return comp.replied;
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
              width: screenSize(80, context),
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
          length: 4,
          child: Scaffold(
            appBar: TabBar(
              indicatorColor: Colors.green,
              tabs: <Widget>[
                Tab(
                  child: Icon(Icons.star,color: Colors.amber,),
                ),
                Tab(
                  child: AutoSizeText(
                    "Yeniler",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                    child: AutoSizeText(
                  'Cevaplananlar',
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow[900],
                  ),
                )),
                Tab(
                  child: AutoSizeText(
                    "Çözülenler",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff00681D),
                      fontSize: screenSize(12, context),
                    ),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              children: <Widget>[
                buildList(complains: complain,all:true),
                buildList(complains: complain, unresolved: true),
                buildList(complains: complain, replied: true,solved: false),
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
