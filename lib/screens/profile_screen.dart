import 'package:DestekVer/provider/complains_provider.dart';
import 'package:DestekVer/widget/complain_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  Widget buildScreen(
      List<Complain> complain, String username, BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                child: Icon(
                  Icons.account_circle,
                  size: 90,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                username,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              width: 85,
            ),
            Row(
              children: <Widget>[
                Text(
                  ' 5',
                  style: TextStyle(fontSize: 28),
                ),
                Stack(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 40,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.black87,
                      size: 40,
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
          child: complain.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ComplainItem(
                      complain[index],
                    );
                  },
                  itemCount: complain.length,
                )
              : Container(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Complain> complains =
        Provider.of<ComplainsProvider>(context).allComplains;
    String username = ModalRoute.of(context).settings.arguments;

    List<Complain> personsComplains = complains.where((comp) {
      print(comp.username);
      if (username == null) {
        return comp.username.toLowerCase() == "ahmet a.";
      } else
        return comp.username == username;
    }).toList();

    return username == null
        ? buildScreen(
            personsComplains,
            'Ahmet Akıl',
            context,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Profilim'),
            ),
            body: buildScreen(
              personsComplains,
              username,
              context,
            ),
          );
  }
}
