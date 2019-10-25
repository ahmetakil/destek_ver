import 'package:flutter/material.dart';

import '../models/complain.dart';
import '../widget/complain_item.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  final List<Complain> complains;
  ProfileScreen(this.complains);

  @override
  Widget build(BuildContext context) {
    List<Complain> complain = complains.where((comp) {
      return comp.name.toLowerCase() == "fatih emin öge ";
    }).toList();

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
        Container(
          child: complain.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (ctx, index) {
                    return ComplainItem(
                      name: complain[index].name,
                      complain: complain[index].complain,
                      location: complain[index].location,
                      upVote: complain[index].upVote,
                      downVote: complain[index].downVote,
                    );
                  },
                  itemCount: complain.length,
                )
              : Container(),
        )
      ],
    );
  }
}
