import 'package:flutter/material.dart';

import '../models/complain.dart';
import '../widget/complain_item.dart';

class ComplainScreen extends StatelessWidget {
  final List<Complain> complains;

  ComplainScreen(this.complains);

  @override
  Widget build(BuildContext context) {
    if (complains.isEmpty) {
      return Center(
        child: Text('Şikayet eklemeye başla!.',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return ComplainItem(
          name: complains[index].name,
          complain: complains[index].complain,
          location: complains[index].location,
          upVote: complains[index].upVote,
          downVote: complains[index].downVote,
        );
      },
      itemCount: complains.length,
    );
  }
}
