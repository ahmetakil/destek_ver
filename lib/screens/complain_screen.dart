import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/screens/new_complain.dart';
import 'package:DestekVer/util/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/complain_list.dart';

class ComplainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final complains = Provider.of<ComplainsProvider>(context);

    if (complains.unresolvedComplains.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Şikayet eklemeye başla!.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(NewComplain.routeName);
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.green,
                  size: 50,
                ),
              ),
            )
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.green,
          tabs: <Widget>[
            Tab(
              child: AutoSizeText(
                "Yeni Şikayetler",
                textAlign: TextAlign.center,
                minFontSize: 10,
                maxLines: 2,
                stepGranularity: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenSize(12.5, context),
                ),
              ),
            ),
            Tab(
                child: AutoSizeText(
              'Cevaplananlar',
              minFontSize: 10,
              maxLines: 1,
              stepGranularity: 1,
              style: TextStyle(
                color: Colors.yellow[900],
                fontSize: screenSize(12.5, context),
              ),
            )),
            Tab(
              child: AutoSizeText(
                "Çözülenler",
                minFontSize: 10,
                maxLines: 1,
                stepGranularity: 1,
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
            ComplainList(0),
            ComplainList(1),
            ComplainList(2),
          ],
        ),
      ),
    );
  }
}
