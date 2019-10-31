import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 50,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      comp.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  DateFormat.yMd().format(comp.dateTime),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.topLeft,
              height: 450,
              child: Text(
                comp.complain,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  comp.upVote > 0
                      ? Icon(Icons.arrow_upward, color: Colors.blue)
                      : Icon(Icons.arrow_upward),
                  Text(
                    comp.upVote.toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Text(
                comp.location,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
