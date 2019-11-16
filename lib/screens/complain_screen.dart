import 'package:demo_app1/provider/complains_provider.dart';
import 'package:demo_app1/screens/new_complain.dart';
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
            Tab(text: 'Çözülenler')
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
            Positioned(
              right: -20,
              bottom: 10,
              child: InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(NewComplain.routeName),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12),
                          child: Text(
                            "Şikayet Ekle",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
