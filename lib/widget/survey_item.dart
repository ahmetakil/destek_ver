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
    return RatingBar(
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
    );
  }

  Widget buildButtonWithoutImages() {}

  Widget buildButtonWithImages(
      String imageUrl, String answer, QuestionAnswer questionAnswer) {
        //questionAnswer set state de booleanını değiştiricek 
        // 
      }

  Widget buildQuestion() {}

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
