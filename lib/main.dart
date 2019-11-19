import 'package:demo_app1/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/new_complain.dart';
import './screens/tabs_screen.dart';
import './screens/complain_detail_screen.dart';
import './provider/complains_provider.dart';
import './screens/profile_screen.dart';
import './screens/survey_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => ComplainsProvider(),
        ),
        ChangeNotifierProvider(
          builder: (_) => LocationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Destek Ver',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.black,
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          NewComplain.routeName: (ctx) => NewComplain(),
          ComplainDetailScreen.routeName: (ctx) => ComplainDetailScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          SurveyScreen.routeName : (ctx) => SurveyScreen()
        },
      ),
    );
  }
}

/*
TODO:
  1- Profilde son şikayetler
  3- Gönderilecek birim (büyükşehir veya küçükşehir) --
  6- Öneri sekmesi -
  7- Konuya, konuma göre filtreleme ++

  - şikayete medya ekleme [Resim-Video]


  == Ad-Soyad yerine Konu gelicek isim profilden çekilicek
  == Detaylı şikayrt ekranında harita içinde konum görüntüleme
  == Giriş yaparken 40 saniyede kayıt ol tarzı ifadeler


https://medium.com/better-programming/flutter-tabbar-with-buttons-as-tabs-ios-style-4dff5ae6c055

HAFTAYA:
  - ANKET
   - ŞİKAYET TÜRLER

   4 KASIM NOTLAR:
    -- Anketler ekranı açılınca 3 tane düğme olucak (anketler için)
    -- Anketin en üstünde başlık / kaç kişi çözdü / kaç dk sürer
    -- Gönder dedikten sonra popup ekran
    -- Profile puan eklenicek hepsi 5 puan
    -- En sol üste drawer eklenicek filtreler için
    -- profil ekranında kaydırlıabilir (twitter gibi)

    15 KASIM NOTLAR:
      - Şikayet verdikten sonra feedback (YOU DID IT!) alert dialog







 */