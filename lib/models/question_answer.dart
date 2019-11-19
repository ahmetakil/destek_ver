class QuestionAnswer {
  final String imageUrl;
  final String answer;
  final String choice;
  final bool input;
  final bool image;
  final bool button;
  final bool star;
  double rating;
  String inputFromUser;
  bool selected;

  QuestionAnswer({
    this.imageUrl,
    this.answer,
    this.choice,
    this.input = false,
    this.image = false,
    this.button = false,
    this.star = false,
    this.inputFromUser,
    this.selected = false,
  });
}
