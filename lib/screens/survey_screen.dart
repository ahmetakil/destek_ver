import 'package:demo_app1/widget/survey_item.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/surveyScreen';

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    final int typeOfSurvey = ModalRoute.of(context).settings.arguments as int;
    String survey = SURVEY_TYPES[typeOfSurvey];
    List<String> questions = QUESTIONS[survey];
    return Scaffold(
      appBar: AppBar(
        title: Text('DestekVar'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SurveyItem(
                questions[index],
                ANSWERS[questions[index]],
              ),
              SizedBox(
                height: 15,
              )
            ],
          );
        },
        itemCount: questions.length,
      ),
    );
  }
}
