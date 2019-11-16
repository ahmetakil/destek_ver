import 'dart:convert';
import 'package:http/http.dart' as http;

const API_KEY = "AIzaSyD915gwBSU971KjW52JegMbQgZBQB56TVQ";

class LocationUtil{

  static String generateLocImage({double latitude,double longitude}){

    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Alabel:C%7C$latitude,$longitude&key=$API_KEY";
  }

  static Future<String> getAddress(double lat,double lng) async{

    final url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$API_KEY";

    final res = await http.get(url);

    return json.decode(res.body)["results"][0]["formatted_address"];
  }


}