import 'dart:io';

import 'package:DestekVer/models/complain.dart';
import 'package:DestekVer/util/location_util.dart';
import 'package:firebase_storage_image/firebase_storage_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      username: 'Fatih Emin Öge',
      complainTopic: 'Park Sorunu',
      complain: 'Kadiköydeki oyun parklarındaki oyuncaklar kırık',
      location: LatLng(40.990307, 29.0298),
      fullAddress:
          "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      imageUrl: "https://firebasestorage.googleapis.com/v0/b/destekver-e1da1.appspot.com/o/complain-photos%2Fscaled_image_picker2194902650483126746.jpg%7D?alt=media&token=6c249535-7ef9-482f-b1b3-c3630da6bf62",
      upVote: 7,
    ),
    Complain(
      username: 'Ahmet Akıl',
      complainTopic: 'Sokak hayvanları',
      complain: 'Sokak hayvanları geceleri çok ses çıkarıyor.',
      location: LatLng(40.990307, 29.0298),
      fullAddress:
          "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 8,
    ),
    Complain(
      username: 'Fatih Emin Öge',
      complainTopic: 'Çöpler toplanmıyor',
      complain: 'Belediye çöpleri toplamıyor',
      location: LatLng(40.990307, 29.0298),
      fullAddress:
          "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      solved: true,
      upVote: 24
    ),
  ];

  void addNewComplain({
    String username,
    String complainTopic,
    String complain,
    LatLng location,
    DateTime date,
    String imageUrl,
  }) async {
    final newComp = Complain(
      username: username,
      complainTopic: complainTopic,
      complain: complain,
      dateTime: date,
      location: location,
      fullAddress: await LocationUtil.getAddress(location),
      shortAddress: await LocationUtil.getShortAddress(),
      imageUrl: imageUrl,
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
