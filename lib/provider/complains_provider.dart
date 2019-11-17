import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/util/location_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      name: 'Fatih Emin Öge',
      complainMessage: 'Kuyu\'ya Düştüm',
      location: LatLng(40.990307, 29.0298),
      address: "Kadiköy Boğa heykeli",
      dateTime: DateTime.now(),
      upVote: 7,
    ),
  ];

  void addNewComplain({
    String name,
    String complainMessage,
    LatLng location,
    DateTime date,
  }) async {
    final newComp = Complain(
      name: name,
      complainMessage: complainMessage,
      dateTime: date,
      location: location,
      address: await LocationUtil.getAddress(location),
    );
    _complains.insert(0,newComp);
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
