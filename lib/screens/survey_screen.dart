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
  bool isButtonEnabled = false;

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
  }

  void _showDialog(bool allQuestionsAnswered) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(allQuestionsAnswered
              ? "Geri bildiriminiz için teşekkürler"
              : "Lütfen tüm soruları cevaplandırınız"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(
                allQuestionsAnswered ? "Anasayfaya Dön" : "Geri dön",
              ),
              onPressed: () {
                if (allQuestionsAnswered) {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool allQuestionsAnswered() {
    final int typeOfSurvey = ModalRoute.of(context).settings.arguments as int;
    String survey = SURVEY_TYPES[typeOfSurvey];
    List<String> questions = QUESTIONS[survey];
    bool surveyIsCompleted = false;

    for (String question in questions) {
      for (QuestionAnswer answer in ANSWERS[question]) {
        if (answer.selected) {
          surveyIsCompleted = true;
          break;
        } else {
          surveyIsCompleted = false;
        }
      }
    }
    return surveyIsCompleted;
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
          print(allQuestionsAnswered());
          if (allQuestionsAnswered()) {
            _showDialog(allQuestionsAnswered());
          } else {
            _showDialog(allQuestionsAnswered());
          }
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
        title: Text(
          survey,
        ),
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
