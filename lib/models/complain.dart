enum Location { Uskudar, Umraniye, BuyuksehirBelediyesi }

class Complain {
  final String name;
  final String complain;
  final String location;
  DateTime dateTime = DateTime.now();
  int upVote;
  int downVote;

  Complain({
    this.name,
    this.complain,
    this.location,
    this.dateTime,
    this.upVote,
    this.downVote,
  });
}
