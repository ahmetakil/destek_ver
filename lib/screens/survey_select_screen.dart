import 'package:demo_app1/screens/survey_screen.dart';
import 'package:flutter/material.dart';

class SurveySelectScreen extends StatelessWidget {
  final List<String> surveys = [
    'Park Ve Bahçeler',
    'Sokak Hayvanları',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  SurveyScreen.routeName
                );
              },
              child: Text(surveys[0]),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.topLeft,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(surveys[1]),
            ),
          ),
        ),
      ],
    );
  }
}
