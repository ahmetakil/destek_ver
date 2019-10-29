import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/complain.dart';
import '../screens/profile_screen.dart';
import '../screens/complain_detail_screen.dart';

class ComplainItem extends StatefulWidget {
  final Complain complain;

  ComplainItem(this.complain);

  @override
  _ComplainItemState createState() => _ComplainItemState();
}

class _ComplainItemState extends State<ComplainItem> {

  void selectComp(BuildContext context) {
    Navigator.of(context).pushNamed(
      ComplainDetailScreen.routeName,
      arguments: widget.complain,
    );
  }

  void goToProfile(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProfileScreen.routeName,
      arguments: widget.complain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Complain comp = widget.complain;
    return Container(
      padding: EdgeInsets.all(6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        elevation: 6,
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
                        Text(comp.name),
                      ],
                    ),
                  ),
                  Text(DateFormat.yMd().format(comp.dateTime)),
                ],
              ),
            ),
            InkWell(
              onTap: () => selectComp(context),
              child: Container(
                height: 100,
                width: 300,
                child: Text(
                  comp.complain,
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (comp.upVote > 0) {
                              comp.upVote--;
                            } else {
                              comp.upVote++;
                            }
                            comp.downVote = 0;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            comp.upVote > 0
                                ? Icon(Icons.arrow_upward, color: Colors.blue)
                                : Icon(Icons.arrow_upward),
                            Text(comp.upVote.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (comp.downVote > 0) {
                              comp.downVote--;
                            } else {
                              comp.downVote++;
                            }
                            comp.upVote = 0;
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            comp.downVote > 0
                                ? Icon(Icons.arrow_downward, color: Colors.blue)
                                : Icon(Icons.arrow_downward),
                            Text(
                              comp.downVote.toString(),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(comp.location)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
