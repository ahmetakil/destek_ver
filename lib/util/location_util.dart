
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_KEY = "AIzaSyD915gwBSU971KjW52JegMbQgZBQB56TVQ";

class LocationUtil{


  static Future<LatLng> getCurrentLocation() async{

    final locData = await Location().getLocation();
    return LatLng(locData.latitude,locData.longitude);
  }

  static Future<String> generateLocImage(LatLng locData) async{

    return "https://maps.googleapis.com/maps/api/staticmap?center=${locData.latitude},${locData.longitude}&size=600x300&zoom=16&markers=color:red%7Alabel:C%7C${locData.latitude},${locData.longitude}&key=$API_KEY";
  }

  static Future<String> getAddress(LatLng locData) async{

    final url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${locData.latitude},${locData.longitude}&key=$API_KEY";

    final res = await http.get(url);
    print("KAPPA");
    print(res.body);
    return json.decode(res.body)["results"][0]["formatted_address"];
  }

}