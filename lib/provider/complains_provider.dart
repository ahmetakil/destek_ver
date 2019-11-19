import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/util/location_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      name: 'Fatih Emin Öge',
      complainTopic: 'Park Sorunu',
      complain: 'Kadiköydeki oyun parklarındaki oyuncaklar kırık',
      location: LatLng(40.990307, 29.0298),
      fullAddress: "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      upVote: 7,
    ),
    Complain(
      name: 'Ahmet Akıl',
      complainTopic: 'Sokak hayvanları',
      complain: 'Sokak hayvanları geceleri çok ses çıkarıyor.',
      location: LatLng(40.990307, 29.0298),
      fullAddress: "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 7,
    ),
    Complain(
      name: 'Fatih Emin Öge',
      complainTopic: 'Çöpler toplanmıyor',
      complain: 'Belediye çöpleri toplamıyor',
      location: LatLng(40.990307, 29.0298),
      fullAddress: "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      solved: true,
      upVote: 7,
    ),
  ];

  void addNewComplain({
    String name,
    String complainTopic,
    String complain,
    LatLng location,
    DateTime date,
  }) async{
    final newComp = Complain(
      name: name,
      complainTopic: complainTopic,
      complain: complain,
      dateTime: date,
      location: location,
      fullAddress: await LocationUtil.getAddress(location),
      shortAddress: await LocationUtil.getShortAddress(),
    );
    _complains.insert(0, newComp);
    notifyListeners();
  }

  List<Complain> get allComplains {
    return _complains.toList();
  }

  List<Complain> get solvedComplains {
    return _complains.where((comp) => comp.solved).toList();
  }

  List<Complain> get repliedComplains {
    return _complains.where((comp) => comp.replied).toList();
  }
}
