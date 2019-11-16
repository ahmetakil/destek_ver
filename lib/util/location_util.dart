
import 'package:location/location.dart';

const API_KEY = "AIzaSyD915gwBSU971KjW52JegMbQgZBQB56TVQ";

class LocationUtil{


  static Future<LocationData> getCurrentLocation() async{

    final locData = await Location().getLocation();
    return locData;
  }

  static Future<String> generateLocImage() async{

    final locData = await getCurrentLocation();

    return "https://maps.googleapis.com/maps/api/staticmap?center=${locData.latitude},${locData.longitude}&size=600x300&zoom=13&markers=color:red%7Alabel:C%7C${locData.latitude},${locData.longitude}&key=$API_KEY";

  }

}