import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import '../models/question_answer.dart';

class SurveyItem extends StatefulWidget {
  final String question;
  final List<QuestionAnswer> answers;

  SurveyItem(
    this.question,
    this.answers,
  );

  @override
  _SurveyItemState createState() => _SurveyItemState();
}

class _SurveyItemState extends State<SurveyItem> {
  Widget buildRatingStars() {
    double _rating = 0;
    return Column(
      children: <Widget>[
        widget.answers[0].answer == null
            ? Container()
            : Text(widget.answers[0].answer),
        SizedBox(
          height: 10,
        ),
        RatingBar(
          onRatingChanged: (rating) => setState(() => _rating = rating),
          initialRating: _rating,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          filledColor: Colors.yellow,
          emptyColor: Colors.black,
          halfFilledColor: Colors.yellow,
          size: 48,
        ),
      ],
    );
  }

  Widget buildButtonWithoutImages(List<QuestionAnswer> questionAnswers) {
    return Container(
      height: 300,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 3 / 2),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  for (int i = 0; i < questionAnswers.length; i++) {
                    if (questionAnswers[index] != questionAnswers[i]) {
                      questionAnswers[i].selected = false;
                    }
                  }
                  questionAnswers[index].selected =
                      !questionAnswers[index].selected;
                });
              },
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  '${questionAnswers[index].choice} ${questionAnswers[index].answer}',
                  style: TextStyle(
                      color: questionAnswers[index].selected
                          ? Colors.red
                          : Colors.black),
                ),
              ),
            ),
          );
        },
        itemCount: questionAnswers.length,
      ),
    );
  }

  Widget buildButtonWithImages(List<QuestionAnswer> questionAnswers) {
    return Container(
      height: 300,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < questionAnswers.length; i++) {
                  if (questionAnswers[index] != questionAnswers[i]) {
                    questionAnswers[i].selected = false;
                  }
                }
                questionAnswers[index].selected =
                    !questionAnswers[index].selected;
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                child: Image.network(
                  questionAnswers[index].imageUrl,
                  fit: BoxFit.cover,
                ),
                header: GridTileBar(
                  backgroundColor: Colors.black45,
                  leading: Text(
                    '${questionAnswers[index].choice}  ${questionAnswers[index].answer == null ? "" : questionAnswers[0].answer}',
                    style: TextStyle(
                        color: questionAnswers[index].selected
                            ? Colors.red
                            : Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: questionAnswers.length,
      ),
    );
  }

  Widget buildQuestion(String question, Widget widget) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        children: <Widget>[
          Text(
            "$question",
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 20,
          ),
          widget
        ],
      ),
    );
  }

  Widget buildInputTaker(QuestionAnswer questionAnswer) {
    final _inputController = TextEditingController();

    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Lütfen önerinizi kısa bir şekilde belirtiniz',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      controller: _inputController,
      maxLength: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.answers[0].button) {
      return buildQuestion(
          widget.question, buildButtonWithoutImages(widget.answers));
    } else if (widget.answers[0].image) {
      return buildQuestion(
          widget.question, buildButtonWithImages(widget.answers));
    } else if (widget.answers[0].star) {
      return buildQuestion(widget.question, buildRatingStars());
    } else if (widget.answers[0].input) {
      return buildQuestion(widget.question, buildInputTaker(widget.answers[0]));
    } else {
      return Container();
    }
  }
}
