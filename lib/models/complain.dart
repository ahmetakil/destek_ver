import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Complain {
  final String name;
  final String complainTopic;
  final String complain;
  final DateTime dateTime;
  final LatLng location;
  String fullAddress;
  String shortAddress;
  int upVote;
  bool upvoted;
  bool replied;
  bool solved;

  Complain({
    @required this.name,
    @required this.complainTopic,
    @required this.complain,
    @required this.dateTime,
    @required this.location,
    this.shortAddress,
    this.fullAddress,
    this.upVote = 0,
    this.upvoted = false,
    this.replied = false,
    this.solved = false,
  });
}
