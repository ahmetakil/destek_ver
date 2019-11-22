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
            Container(
              child: Icon(
                Icons.account_circle,
                size: 100,
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
              width: 40,
            ),
            Row(
              children: <Widget>[
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
                Text(' 5',style: TextStyle(fontSize: 28),),
              ],
            ),
          ],
        ),
        Divider(
          thickness: 5,
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
      if (username == null) {
        return comp.username.toLowerCase() == "ahmet akıl" ? true : false;
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
              title: Text('DestekVer'),
            ),
            body: buildScreen(
              personsComplains,
              username,
              context,
            ),
          );
  }
}
