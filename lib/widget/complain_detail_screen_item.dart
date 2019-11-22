import 'package:DestekVer/screens/map_screen.dart';
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
      arguments: widget.comp.username,
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
          alignment: Alignment.center,
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
                      size: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.comp.username,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy').format(widget.comp.dateTime),
                          style: TextStyle(
                            fontSize: 15,
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
          child: Column(
            children: <Widget>[
              Text(
                widget.comp.complain,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20,),
              if (widget.comp.imageUrl != null)
                Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(widget.comp.imageUrl,
                  fit: BoxFit.cover,),
                ),
            ],
          ),
        ),
        Spacer(),
        Divider(
          thickness: 0.2,
          color: Colors.grey,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
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
                SizedBox(
                  width: 7,
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
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (_) => MapScreen(
                      widget.comp.location
                    )
                  )),
                  child: Text(
                    widget.comp.fullAddress,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
