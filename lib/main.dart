import 'package:demo_app1/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import './screens/new_complain.dart';
import './screens/tabs_screen.dart';
import './models/complain.dart';
import './screens/complain_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Complain> _complains = [];

  void _addNewComplain(
    String name,
    String complain,
    String location,
    DateTime date,
    int upVote,
    int downVote,
  ) {
    final newComp = Complain(
      name: name,
      complain: complain,
      location: location,
      upVote: upVote,
      downVote: downVote,
    );
    setState(() {
      _complains.add(newComp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.black,
      ),
      routes: {
        '/': (ctx) => TabsScreen(_complains, _addNewComplain),
        NewComplain.routeName: (ctx) => NewComplain(),
        ComplainDetailScreen.routeName: (ctx) => ComplainDetailScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen()
      },
    );
  }
}
