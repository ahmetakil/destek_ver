import 'package:DestekVer/provider/location_provider.dart';
import 'package:DestekVer/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/new_complain.dart';
import './screens/tabs_screen.dart';
import './screens/complain_detail_screen.dart';
import './provider/complains_provider.dart';
import './screens/profile_screen.dart';
import './screens/survey_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

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
        theme: ThemeData(
          primaryColor: Colors.green,
          accentColor: Colors.black,
        ),
        routes: {
          '/': (ctx) => TabsScreen(),
          NewComplain.routeName: (ctx) => NewComplain(),
          ComplainDetailScreen.routeName: (ctx) => ComplainDetailScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          SurveyScreen.routeName: (ctx) => SurveyScreen(),
        },
      ),
    );
  }
}

/*
TODO:
  3- Gönderilecek birim (büyükşehir veya küçükşehir) --
  7- Konuya, konuma göre filtreleme ++


  == Detaylı şikayrt ekranında harita içinde konum görüntüleme
  == Giriş yaparken 40 saniyede kayıt ol tarzı ifadeler


https://medium.com/better-programming/flutter-tabbar-with-buttons-as-tabs-ios-style-4dff5ae6c055

HAFTAYA:
  - ANKET
   - ŞİKAYET TÜRLER

   4 KASIM NOTLAR:
    -- Anketin en üstünde başlık / kaç kişi çözdü / kaç dk sürer
    -- Gönder dedikten sonra popup ekran



    15 KASIM NOTLAR:
      - Şikayet verdikten sonra feedback (YOU DID IT!) alert dialog


    22 KASIM NOTLAR:


    ZAMAN KALIRSA : PROFIL EKRANINDA DA SEKMELER
    YILDIZ SAĞA GEÇSİH PROFİDLE

 */
