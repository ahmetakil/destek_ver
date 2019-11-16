import 'package:demo_app1/provider/complains_provider.dart';
import 'package:demo_app1/widget/complain_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';


  Widget buildScreen(
      List<Complain> complain, String name, BuildContext context) {
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

    List<Complain> complains = Provider.of<ComplainsProvider>(context).allComplains;
    final Complain complainProfile = ModalRoute.of(context).settings.arguments;
    List<Complain> personsComplains = complains.where((comp) {
      return identical(
        comp.name.toLowerCase(),
        complainProfile == null ? "fatih emin öge" : complainProfile.name,
      );
    }).toList();

    return complainProfile == null
        ? buildScreen(
            personsComplains,
            'Ahmet Akıl',
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
