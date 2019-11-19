import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier{

  LatLng location;
  String shortAddress;
  String fullAddress;


}