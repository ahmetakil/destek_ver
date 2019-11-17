import 'package:demo_app1/models/complain.dart';
import 'package:demo_app1/widget/location_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      name: 'Fatih Emin Öge',
      complainTopic: 'Kuyu\'ya Düştüm',
      complain: 'yardım edin',
      location: LatLng(40.990307, 29.0298),
      address: "Kadiköy Boğa heykeli",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 7,
    ),
    Complain(
      name: 'Fatih Emin Öge',
      complainTopic: 'Kuyu\'ya Düştüm',
      complain: 'yardım edin',
      location: LatLng(40.990307, 29.0298),
      address: "Kadiköy Boğa heykeli",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 15,
    ),
    Complain(
      name: 'Fatih Emin Öge',
      complainTopic: 'Kuyu\'ya Düştüm',
      complain: 'yardım edin',
      location: LatLng(40.990307, 29.0298),
      address: "Kadiköy Boğa heykeli",
      dateTime: DateTime.now(),
      solved: true,
      replied: true,
      upVote: 22,
    ),
  ];

  void addNewComplain({
    String name,
    String complainTopic,
    String complain,
    LatLng location,
    String address,
    DateTime date,
  }) async {
    final newComp = Complain(
      name: name,
      complainTopic: complainTopic,
      complain: complain,
      dateTime: date,
      location: location,
      address: LocationInput.address,
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
