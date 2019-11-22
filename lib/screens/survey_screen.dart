import 'package:DestekVer/models/question_answer.dart';
import 'package:DestekVer/widget/survey_item.dart';
import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../util/utils.dart';

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
      floatingActionButton: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          findChoice();
          Navigator.of(context).pop();
        },
        child: Container(
          width: screenSize(75, context),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.send,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Gönder',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        color: Colors.green,
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
