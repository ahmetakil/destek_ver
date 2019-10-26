import 'package:demo_app1/widget/complain_item.dart';
import 'package:flutter/material.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  final List<Complain> allComplains;
  ProfileScreen(this.allComplains);

  Widget buildScreen(
    List<Complain> complain,
    String name,
    BuildContext context,
  ) {
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
                name,
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
    final Complain complainProfile = ModalRoute.of(context).settings.arguments;
    List<Complain> personsComplains = allComplains.where((comp) {
      return identical(
        comp.name,
        complainProfile == null ? "fatih emin öge" : complainProfile.name,
      );
    }).toList();

    return complainProfile == null
        ? buildScreen(
            personsComplains,
            'Fatih Emin Öge',
            context,
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('DestekVar'),
            ),
            body: buildScreen(
              personsComplains,
              complainProfile.name,
              context,
            ),
          );
  }
}
