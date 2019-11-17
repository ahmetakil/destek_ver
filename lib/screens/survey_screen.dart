import 'package:demo_app1/models/question_answer.dart';
import 'package:demo_app1/widget/survey_item.dart';
import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/surveyScreen';

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  String question = "aaaaaa";
  List<QuestionAnswer> answers = [
    QuestionAnswer(
        imageUrl:
            'https://iasbh.tmgrup.com.tr/7fa563/800/420/0/0/660/345?u=https://isbh.tmgrup.com.tr/sbh/2018/09/29/istanbulda-kosu-yapilacak-en-iyi-yerler-istanbul-kosu-parkuru-yerleri-1538207897481.jpg',
        selected: false,
        choice: 'A)'),
    QuestionAnswer(
        imageUrl:
            'https://iasbh.tmgrup.com.tr/7fa563/800/420/0/0/660/345?u=https://isbh.tmgrup.com.tr/sbh/2018/09/29/istanbulda-kosu-yapilacak-en-iyi-yerler-istanbul-kosu-parkuru-yerleri-1538207897481.jpg',
        selected: false,
        choice: 'B)'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DestekVar'),
      ),
      body: SingleChildScrollView(
        child: SurveyItem(question, answers),
      ),
    );
  }
}
