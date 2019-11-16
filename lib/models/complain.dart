class Complain {
  final String name;
  final String complain;
  final String location;
  final DateTime dateTime = DateTime.now();
  int upVote;
  bool upvoted;
  bool replied;
  bool solved;

  Complain({
    this.name,
    this.complain,
    this.location,
    this.upVote,
    this.upvoted = false,
    this.replied = false,
    this.solved = false,
  });
}
