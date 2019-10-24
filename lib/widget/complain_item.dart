import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/complain_detail_screen.dart';

class ComplainItem extends StatelessWidget {
  final String name;
  final String complain;
  final String location;
  final DateTime dateTime = DateTime.now();
  final int upVote;
  final int downVote;

  ComplainItem({
    @required this.name,
    @required this.complain,
    @required this.location,
    @required this.upVote,
    @required this.downVote,
  });

  void selectComp(BuildContext context) {
    final _complain = Complain(
      name: name,
      complain: this.complain,
      upVote: upVote,
      downVote: downVote,
      location: location,
    );
    Navigator.of(context).pushNamed(
      ComplainDetailScreen.routeName,
      arguments: _complain,
    );
  }

  void goToProfile(BuildContext context) {
    final _complain = Complain(
      name: name,
      complain: this.complain,
      upVote: upVote,
      downVote: downVote,
      location: location,
    );
    Navigator.of(context).pushNamed(
      ProfileScreen.routeName,
      arguments: _complain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () => goToProfile(context),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.account_circle),
                      SizedBox(
                        width: 10,
                      ),
                      Text(name),
                    ],
                  ),
                ),
                Text(DateFormat.yMd().format(dateTime)),
              ],
            ),
          ),
          InkWell(
            onTap: () => selectComp(context),
            child: Container(
              height: 100,
              width: 300,
              child: Text(
                complain,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_upward,
                    ),
                    Text(upVote.toString()),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.arrow_downward),
                    Text(
                      downVote.toString(),
                    )
                  ],
                ),
                Text(location)
              ],
            ),
          )
        ],
      ),
    );
  }
}
