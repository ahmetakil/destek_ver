import 'package:demo_app1/models/complain.dart';
import 'package:flutter/cupertino.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [];

  void addNewComplain(String name, String complain, String location,
      DateTime date, int upVote) {
    final newComp = Complain(
      name: name,
      complain: complain,
      location: location,
      upVote: upVote,
    );
      _complains.add(newComp);
      notifyListeners();
  }

  List<Complain> get complains{
    return [..._complains];
  }
}
