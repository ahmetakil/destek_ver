import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './complain_item.dart';
import '../provider/complains_provider.dart';
import '../models/complain.dart';

enum complainFilter {
  UNRESOLVED,
  REPLIED,
  SOLVED,
  ALL,
}

class ComplainList extends StatelessWidget {
  final typeOfList;

  ComplainList(this.typeOfList);

  @override
  Widget build(BuildContext context) {
    final complainData = Provider.of<ComplainsProvider>(context);
    List<Complain> complains = [];

    switch (typeOfList) {
      case complainFilter.UNRESOLVED:
        complains = complainData.unresolvedComplains;
        break;
      case complainFilter.REPLIED:
        complains = complainData.repliedComplains;
        break;
      case complainFilter.SOLVED:
        complains = complainData.solvedComplains;
        break;
      case complainFilter.ALL:
        complains = complainData.allComplains;
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
