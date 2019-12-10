import 'package:auto_size_text/auto_size_text.dart';
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
  void showDetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      ComplainDetailScreen.routeName,
      arguments: widget.complain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Complain comp = widget.complain;
    Color statusOfComplain;
    statusOfComplain = comp.solved
        ? Colors.green[800]
        : comp.replied ? Colors.amber[400] : Colors.white;
    return Container(
      padding: EdgeInsets.all(6),
      child: InkWell(
        onTap: () => showDetails(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: statusOfComplain,
              width: 2
            ),
          ),
          margin: EdgeInsets.all(8),
          elevation: 6,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        SizedBox(
                          width: 10,
                        ),
                        Text(comp.username),
                      ],
                    ),
                    Text(DateFormat('dd/MM/yyyy').format(comp.dateTime)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left:10,right:10),
                height: screenSize(100.0, context),
                child: Container(
                  width: double.infinity,
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
                        height: 8,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          comp.complain,
                          maxLines: 5,
                          minFontSize: 12,
                          style: TextStyle(
                            fontSize: screenSize(12, context)
                          ),
                        ),
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
                          child: comp.solved ? RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${comp.upVote}",
                                    style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold)
                                  ),
                                  TextSpan(
                                    text: " destekle sorun çözüldü",style: TextStyle(color: Colors.blueGrey,fontSize: 14)
                                  ),
                                ]
                              )
                          ) : Row(
                            children: <Widget>[
                              comp.upvoted
                                  ? Icon(Icons.check, color: Colors.green,size: 26,)
                                  : Icon(Icons.check,size: 26,),
                              Text(comp.upVote.toString(),style: TextStyle(
                                color: comp.upvoted ? Colors.green : Colors.black
                              ),),
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
                          comp.shortAddress ?? "NULL",
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
      ),
    );
  }
}
