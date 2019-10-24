import 'package:demo_app1/widget/complain_item.dart';
import 'package:flutter/material.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';
  
  final List<Complain> complains;
  ProfileScreen(this.complains);

  @override
  Widget build(BuildContext context) {
    final Complain complain = ModalRoute.of(context).settings.arguments;

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
                "Fatih Emin Öge",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
        Divider(
          thickness: 5,
        ),
        identical(complain.name.toLowerCase(), "fatih emin öge")
            ? ComplainItem(
                name: complain.name,
                complain: complain.complain,
                location: complain.location,
                upVote: complain.upVote,
                downVote: complain.downVote,
              )
            : Container(),
      ],
    );
  }
}
