import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/screens/new_complain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/complain_list.dart';

class ComplainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final complains = Provider.of<ComplainsProvider>(context);

    if (complains.allComplains.isEmpty) {
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
          labelColor: Colors.green,
          indicatorColor: Colors.green,
          tabs: <Widget>[
            Tab(text: 'Tüm Şikayetler'),
            Tab(text: 'Cevaplananlar'),
            Tab(text: 'Çözülenler'),
          ],
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              children: <Widget>[
                ComplainList(0),
                ComplainList(1),
                ComplainList(2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
