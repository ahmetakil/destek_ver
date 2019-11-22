import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import '../models/question_answer.dart';
import '../util/utils.dart';

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
  Widget buildRatingStars(QuestionAnswer answer) {
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
          onRatingChanged: (rating) => setState(() {
            _rating = rating;
            answer.rating = rating;
          }),
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
      child: Wrap(
        alignment: WrapAlignment.center,
        children: questionAnswers.map(
          (answer) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < questionAnswers.length; i++) {
                      if (answer != questionAnswers[i]) {
                        questionAnswers[i].selected = false;
                      }
                    }
                    answer.selected = !answer.selected;
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(15),
                  child: Text(
                    '${answer.choice} ${answer.answer}',
                    style: TextStyle(
                      color: answer.selected ? Colors.red : Colors.black,
                      fontSize: 16,
                      fontWeight:
                          answer.selected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget buildButtonWithImages(List<QuestionAnswer> questionAnswers) {
    return Container(
      height: questionAnswers[0].answer == null
          ? questionAnswers.length * screenSize(80.0, context)
          : questionAnswers.length * screenSize(225.0, context),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: questionAnswers.map((answer) {
          return Container(
            height: answer.answer == null
                ? screenSize(100.0, context)
                : screenSize(200.0, context),
            width: answer.answer == null
                ? screenSize(130.0, context)
                : double.infinity,
            margin: EdgeInsets.all(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                setState(() {
                  if (!answer.multipleChoice) {
                    for (int i = 0; i < questionAnswers.length; i++) {
                      if (answer != questionAnswers[i]) {
                        questionAnswers[i].selected = false;
                      }
                    }
                  }

                  answer.selected = !answer.selected;
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: GridTile(
                  child: CachedNetworkImage(
                    imageUrl: answer.imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  header: GridTileBar(
                    backgroundColor: Colors.black45,
                    leading: Text(
                      '${answer.choice}  ${answer.answer == null ? "" : answer.answer}',
                      style: TextStyle(
                        color: answer.selected ? Colors.red : Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildInputTaker(QuestionAnswer questionAnswer) {
    final _inputController = TextEditingController();

    return TextField(
      decoration: InputDecoration(
        labelText: 'Lütfen önerinizi kısa bir şekilde belirtiniz',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onSubmitted: (_) => questionAnswer.inputFromUser = _inputController.text,
      maxLength: 100,
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
        ),
      ),
      child: Column(
        children: <Widget>[
          Text(
            "$question",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          widget
        ],
      ),
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
      return buildQuestion(
          widget.question, buildRatingStars(widget.answers[0]));
    } else if (widget.answers[0].input) {
      return buildQuestion(widget.question, buildInputTaker(widget.answers[0]));
    } else {
      return Container();
    }
  }
}
