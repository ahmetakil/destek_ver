import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/complain.dart';
import '../screens/profile_screen.dart';

class ComplainDetailScreenItem extends StatefulWidget {
  final Complain comp;
  ComplainDetailScreenItem(this.comp);

  @override
  _ComplainDetailScreenItemState createState() =>
      _ComplainDetailScreenItemState();
}

class _ComplainDetailScreenItemState extends State<ComplainDetailScreenItem> {
  void goToProfile(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProfileScreen.routeName,
      arguments: widget.comp,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(10),
          child: Text(
            widget.comp.complainTopic,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => goToProfile(context),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.account_circle,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.comp.name,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(widget.comp.dateTime),
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            height: 400,
            //Fotoğraf olursa buraya gelicek
            child: Text(
              widget.comp.complain,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        Divider(
          thickness: 0.2,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  icon: widget.comp.upvoted
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.check),
                  onPressed: () => setState(
                    () {
                      if (widget.comp.upvoted) {
                        widget.comp.upVote--;
                        widget.comp.upvoted = false;
                      } else {
                        widget.comp.upVote++;
                        widget.comp.upvoted = true;
                      }
                    },
                  ),
                ),
                Text(
                  widget.comp.upVote.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Text(
                widget.comp.fullAddress,
                textAlign: TextAlign.right,
                softWrap: true,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
