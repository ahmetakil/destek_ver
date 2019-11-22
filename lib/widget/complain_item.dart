import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/complain.dart';
import '../screens/profile_screen.dart';
import '../screens/complain_detail_screen.dart';
import '../util/utils.dart';


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
      arguments: widget.complain.username,
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
                        Text(comp.username),
                      ],
                    ),
                  ),
                  Text(DateFormat('dd/MM/yyyy').format(comp.dateTime)),
                ],
              ),
            ),
            InkWell(
              onTap: () => selectComp(context),
              child: Container(
                height: screenSize(100.0, context),
                width: screenSize(280.0, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      comp.complainTopic,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      comp.complain,
                    )
                  ],
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
                            if (comp.upvoted) {
                              comp.upVote--;
                              comp.upvoted = false;
                            } else {
                              comp.upVote++;
                              comp.upvoted = true;
                            }
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            comp.upvoted
                                ? Icon(Icons.check, color: Colors.green)
                                : Icon(Icons.check),
                            Text(comp.upVote.toString()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                  Container(
                    child: Flexible(
                      fit: FlexFit.tight,
                      flex: 1,
                      child: Text(
                        comp.shortAddress??"NULL",
                        textAlign: TextAlign.right,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
