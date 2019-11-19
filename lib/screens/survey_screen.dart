import 'package:demo_app1/models/question_answer.dart';
import 'package:demo_app1/widget/survey_item.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/surveyScreen';

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<Map<String, QuestionAnswer>> answerToQuestions;

  void findChoice() {
    final int typeOfSurvey = ModalRoute.of(context).settings.arguments as int;
    String survey = SURVEY_TYPES[typeOfSurvey];
    List<String> questions = QUESTIONS[survey];

    answerToQuestions = questions.map((question) {
      ANSWERS[question].map((answer) {
        return answer.selected
            ? [
                {question: answer}
              ]
            : null;
      });
    }).toList();

    answerToQuestions.forEach((answer) {
      print(answer);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int typeOfSurvey = ModalRoute.of(context).settings.arguments as int;
    String survey = SURVEY_TYPES[typeOfSurvey];
    List<String> questions = QUESTIONS[survey];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          findChoice();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
        title: Text('DestekVer'),
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
