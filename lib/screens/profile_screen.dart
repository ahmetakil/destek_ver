import 'package:flutter/material.dart';

import '../models/complain.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final Complain complain = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(complain.name),
      ),
    );
  }
}
