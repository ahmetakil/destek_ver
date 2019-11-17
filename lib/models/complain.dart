import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Complain {
  final String name;
  final String complainMessage;
  final DateTime dateTime;
  final LatLng location;
  final String address;
  int upVote;
  bool upvoted;
  bool replied;
  bool solved;

  Complain({
    @required this.name,
    @required this.complainMessage,
    @required this.dateTime,
    @required this.location,
    this.address,
    this.upVote = 0,
    this.upvoted = false,
    this.replied = false,
    this.solved = false,
  });
}
