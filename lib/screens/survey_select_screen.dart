import 'package:flutter/material.dart';

import '../screens/survey_screen.dart';

class SurveySelectScreen extends StatelessWidget {
  static const routeName = '/SurveySelectScreen';

  final List<String> surveys = [
    'Park ve Bahçeler',
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
          onTap: () {
            Navigator.of(context).pushNamed(
              SurveyScreen.routeName,
              arguments: 0,
            );
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                surveys[0],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              SurveyScreen.routeName,
              arguments: 1,
            );
          },
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                surveys[1],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
