import 'package:demo_app1/models/complain.dart';
import 'package:flutter/material.dart';

class ComplainDetailScreen extends StatelessWidget {
  static const routeName = '/complain-detail';

  @override
  Widget build(BuildContext context) {
    final Complain comp = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(),
    );
  }
}
