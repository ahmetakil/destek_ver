import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Text("Filtre Seç"),
          Divider(),
          ListTile(
            leading: Icon(Icons.alarm),

          )
        ],
      ),
    );
  }
}
