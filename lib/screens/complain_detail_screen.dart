import 'package:flutter/material.dart';

import '../widget/complain_detail_screen_item.dart';
import '../models/complain.dart';

class ComplainDetailScreen extends StatelessWidget {
  static const routeName = '/complain-detail';

  @override
  Widget build(BuildContext context) {
    final Complain comp = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'DestekVer',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: ComplainDetailScreenItem(comp));
  }
}
