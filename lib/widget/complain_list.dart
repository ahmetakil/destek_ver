import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './complain_item.dart';
import '../provider/complains_provider.dart';
import '../models/complain.dart';

class ComplainList extends StatelessWidget {
  final int typeOfList;

  ComplainList(this.typeOfList);

  @override
  Widget build(BuildContext context) {
    final complainData = Provider.of<ComplainsProvider>(context);
    List<Complain> complains = [];

    switch (typeOfList) {
      case 0:
        complains = complainData.unresolvedComplains;
        break;
      case 1:
        complains = complainData.repliedComplains;
        break;
      case 2:
        complains = complainData.solvedComplains;
        break;
      default:
        complains = complainData.unresolvedComplains;
    }

    return ListView.builder(
          itemBuilder: (ctx, index) {
            return ComplainItem(
              complains[index],
            );
          },
          itemCount: complains.length,
        );
  }
}
