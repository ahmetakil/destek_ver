import 'package:demo_app1/provider/complains_provider.dart';
import 'package:demo_app1/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ComplainsProvider(),
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
          ProfileScreen.routeName: (ctx) => ProfileScreen()
        },
      ),
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