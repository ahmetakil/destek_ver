import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/complain_detail_screen.dart';

class ComplainItem extends StatefulWidget {
  final String name;
  final String complain;
  final String location;
  int upVote;
  int downVote;

  ComplainItem({
    @required this.name,
    @required this.complain,
    @required this.location,
    @required this.upVote,
    @required this.downVote,
  });

  @override
  _ComplainItemState createState() => _ComplainItemState();
}

class _ComplainItemState extends State<ComplainItem> {
  final DateTime dateTime = DateTime.now();
  bool bUpvote = false;
  bool bDownVote = false;

  void selectComp(BuildContext context) {
    final _complain = Complain(
      name: widget.name,
      complain: widget.complain,
      upVote: widget.upVote,
      downVote: widget.downVote,
      location: widget.location,
    );
    Navigator.of(context).pushNamed(
      ComplainDetailScreen.routeName,
      arguments: _complain,
    );
  }

  void goToProfile(BuildContext context) {
    final _complain = Complain(
      name: widget.name,
      complain: widget.complain,
      upVote: widget.upVote,
      downVote: widget.downVote,
      location: widget.location,
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
                      Text(widget.name),
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
                widget.complain,
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
                          if (bUpvote) {
                            bUpvote = false;
                            widget.upVote--;
                          } else {
                            widget.upVote++;
                            bUpvote = true;
                            bDownVote = false;
                            widget.downVote > 0
                                ? widget.downVote--
                                : widget.downVote;
                          }
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          bUpvote
                              ? Icon(Icons.arrow_upward, color: Colors.blue)
                              : Icon(Icons.arrow_upward),
                          Text(widget.upVote.toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (bDownVote) {
                            bDownVote = false;
                            widget.downVote--;
                          } else {
                            widget.downVote++;
                            bDownVote = true;
                            bUpvote = false;
                            widget.upVote > 0 ? widget.upVote-- : widget.upVote;
                          }
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          bDownVote
                              ? Icon(Icons.arrow_downward, color: Colors.blue)
                              : Icon(Icons.arrow_downward),
                          Text(
                            widget.downVote.toString(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text(widget.location)
              ],
            ),
          )
        ],
      ),
    );
  }
}
