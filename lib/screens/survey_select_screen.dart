import 'package:DestekVer/util/utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../screens/survey_screen.dart';

class SurveySelectScreen extends StatelessWidget {
  static const routeName = '/SurveySelectScreen';

  final List<String> surveys = [
    'Park ve Bahçeler',
    'Sokak Hayvanları',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SurveyScreen.routeName,
                  arguments: 0,
                );
              },
              child: SurveyCard(name: surveys[0], reward: 5,imageName: "assets/bahce.jpg",time: "3 dakika",),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    SurveyScreen.routeName,
                    arguments: 1,
                  );
                },
                child: SurveyCard(name: surveys[1], reward: 4,imageName: "assets/hayvan.jpeg",time: "25 saniye",)),
          ],
        ),
      ),
    );
  }
}

class SurveyCard extends StatelessWidget {
  final String name;
  final int reward;
  final String time;
  final String imageName;

  SurveyCard({this.name, this.reward,this.time,this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        width: 300,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              spreadRadius: 2,
              offset: Offset(1,4)
            )
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff56ab2f),
              Color(0xffa8e063),
            ],
            tileMode: TileMode.clamp
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                  imageName,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 80,
                )),
            Positioned(
              top: 5,
              right: 5,
              child: Row(
                children: <Widget>[
                  Text(
                    '$reward',
                    style: TextStyle(fontSize: screenSize(20, context)),
                  ),
                  Stack(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: screenSize(30, context),
                      ),
                      Icon(
                        Icons.star_border,
                        color: Colors.black87,
                        size: screenSize(30, context),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 67,
              right: 12,
              child: Text(
                "Bu anket $time sürer",
                style: TextStyle(color: Colors.white.withOpacity(0.8),fontSize: 15),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: Text(name,
                  style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: Text("120 kisi tarafından çözüldü",style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.9)
              ),),
            ),
            Positioned(
              top: 100,
              left: 10,
              child: Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AutoSizeText(
                    "",
                    softWrap: true,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
