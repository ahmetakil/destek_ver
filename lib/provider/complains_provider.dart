import 'package:demo_app1/models/complain.dart';
import 'package:flutter/cupertino.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      name: 'Fatih Emin Öge',
      complain: 'Kuyu\'ya Düştüm',
      location: 'Kadıköy',
      upVote: 7,
    ),
    Complain(
      name: 'Fatih Emin Öge',
      complain: 'Kuyu\'ya Düştüm',
      location: 'Üsküdar',
      upVote: 15,
      replied: true,
      solved: false
    ),
    Complain(
      name: 'Fatih Emin Öge',
      complain: 'Kuyu\'ya Düştüm',
      location: 'Maltepe',
      upVote: 22,
      replied: true,
      solved: true
    ),
  ];

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
