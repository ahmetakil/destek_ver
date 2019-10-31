import 'package:demo_app1/provider/complains_provider.dart';
import 'package:demo_app1/screens/new_complain.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/complain.dart';
import '../widget/complain_item.dart';

class ComplainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Complain> complains =
        Provider.of<ComplainsProvider>(context).complains;

    if (complains.isEmpty) {
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
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (ctx, index) {
            return ComplainItem(
              complains[index],
            );
          },
          itemCount: complains.length,
        ),
        Positioned(
            right: 20,
            bottom: 20,
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed(NewComplain.routeName),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),

                  color: Colors.green
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      ),
                      Text(
                        "Şikayet Ekle",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
