import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/widget/complain_item.dart';
import 'package:flutter/material.dart';

class ComplainScreen extends StatelessWidget {
  final List<Complain> complains;

  ComplainScreen(this.complains);

  @override
  Widget build(BuildContext context) {
    if (complains.isEmpty) {
      return Center(
        child: Text('Daha hiç şikayet yapılmamış'),
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
