import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class SurveyScreen extends StatefulWidget {
  static const routeName = '/surveyScreen';

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  Widget buildButton({String option = "", String text, bool choice = false}) {
    return Container(
      width: 150,
      child: FlatButton(
        onPressed: () {
          setState(() {
            choice = !choice;
          });
        },
        child: Row(
          children: <Widget>[
            option == ""
                ? Container()
                : Text(
                    option,
                    style: TextStyle(
                        fontSize: 18,
                        color: choice ? Colors.red : Colors.black),
                  ),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 14, color: choice ? Colors.red : Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuestions(String text, Widget widget) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
<<<<<<< HEAD
          border: Border.all(color: Colors.grey),
=======
          border: Border.all(
            color: Colors.grey
          ),
>>>>>>> 1cb90027d53dbbfca21b239ec15b011bf0b1d16c
          borderRadius: BorderRadius.circular(
            10,
          )),
      child: Column(
        children: <Widget>[
          Text(
            "$text",
            style: TextStyle(fontSize: 15),
          ),
          widget
        ],
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DestekVar'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              buildQuestions(
                "Yaşadığınız şehirde çevresel ya da idari belediyenin çözmesi gereken sorunların ne kadar olduğunu düşünüyorsunuz ? ",
                buildRatingStars(),
              ),
              SizedBox(
                height: 15,
              ),
              buildQuestions(
                "Belediye'nin sosyal medya hesapları,beyaz masa vb. tüm kanallardan belediyeye yıllık şikayet bildirme aralığınız nedir ?",
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton(option: "A)", text: "1-5"),
                        buildButton(option: "B)", text: "5-10"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton(option: "C)", text: "10-15"),
                        buildButton(option: "D)", text: "15-20"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              buildQuestions(
                "Yaşadığınız şehirdeki diğer vatandaşların nelerden şikayetçi olduğunu bilmek istermiydiniz, bunu öğrenmek için vakit ayırır mıydınız ?",
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildButton(text: "Evet"),
                    buildButton(text: "Hayır"),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              buildQuestions(
                "Belediyenin sağladığı hizmetlerin ve çözdüğü sorunların tanıtımının ne dereecede yeterli yapıldığını düşünüyorsunuz ?",
                buildRatingStars(),
              ),
              SizedBox(
                height: 15,
              ),
              buildQuestions(
                "Yaşadığınız şehirdeki belediyeye bir istek ya da şikayet iletirken ne kadar zorlanıyorsunuz,belediyenin vatandaşlarla iletişimini yeterli buluyormusunuz ?",
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton(option: "A)", text: "Hiç Zorlanmıyorum"),
                        buildButton(option: "B)", text: "Gayet İyi"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        buildButton(option: "C)", text: "Çok Zorlanıyorum"),
                        buildButton(option: "D)", text: "Hiç Yeterli Değil"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    "Gönder",
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
<<<<<<< HEAD
                ),
              )
            ],
          ),
=======
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              width: double.infinity,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.green,
                onPressed: () {},
                child: Text("Gönder",style: TextStyle(color: Colors.white,fontSize: 26),),
              ),
            )
          ],
>>>>>>> 1cb90027d53dbbfca21b239ec15b011bf0b1d16c
        ),
      ),
    );
  }
}
