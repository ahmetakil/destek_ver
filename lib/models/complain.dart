class Complain {
  final String name;
  final String complain;
  final String location;
  final DateTime dateTime = DateTime.now();
  int upVote;
  int downVote;

  Complain({
    this.name,
    this.complain,
    this.location,
    this.upVote,
    this.downVote,
  });
}
