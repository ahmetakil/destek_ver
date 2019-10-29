import 'package:demo_app1/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import './screens/new_complain.dart';
import './screens/tabs_screen.dart';
import './models/complain.dart';
import './screens/complain_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Complain> _complains = [];
  
  void _addNewComplain(
    String name,
    String complain,
    String location,
    DateTime date,
    int upVote,
    int downVote,
  ) {
    final newComp = Complain(
      name: name,
      complain: complain,
      location: location,
      upVote: upVote,
      downVote: downVote,
    );
    setState(() {
      _complains.add(newComp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destek Ver',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.black,
      ),
      routes: {
        '/': (ctx) => TabsScreen(_complains, _addNewComplain),
        NewComplain.routeName: (ctx) => NewComplain(),
        ComplainDetailScreen.routeName: (ctx) => ComplainDetailScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(_complains)
      },
    );
  }
}

/*
TODO:
  1- Profilde son şikayetler
  2- Gerçek konum ekleme isterse elle veya otomatik ++
  3- Gönderilecek birim (büyükşehir veya küçükşehir) --
  4- Fake şikayet türleri -> [Tüm şikayetler-{Cevaplanan ve çözülen},Cevaplanan,Çözülen] ++
  5- Anket sekmesi ++
  6- Öneri sekmesi -
  7- Konuya, konuma göre filtreleme ++

  - eksi oy kaldırılabilir
  - şikayete medya ekleme [Resim-Video]
  - konu eklenebilir


  == Ad-Soyad yerine Konu gelicek isim profilden çekilicek
  == Şikayette 200 karakter sınırı
  == Detaylı şikayrt ekranında harita içinde konum görüntüleme
  == tarih AY/GUN/YIL
  == floationg action buttonın yanına "Şikayet Ekle" yazısı
  == Giriş yaparken 40 saniyede kayıt ol tarzı ifadeler


https://medium.com/better-programming/flutter-tabbar-with-buttons-as-tabs-ios-style-4dff5ae6c055

HAFTAYA:
  - KONUM
  - ANKET
   - ŞİKAYET TÜRLER

 */