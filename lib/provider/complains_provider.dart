import 'package:DestekVer/models/complain.dart';
import 'package:DestekVer/util/location_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ComplainsProvider with ChangeNotifier {
  List<Complain> _complains = [
    Complain(
      username: 'Arzu Y.',
      complainTopic: 'Sokağa Masa Konulması',
      complain:
          'Merhaba, Beşiktaş Abbasağa’daki evimin sokağında kafeler izinleri olmamasına rağmen sokağa masa koyuyorlar. Zaten daracık olan sokak insan kalabalığıyla daha da sıkışık oluyor sürekli bir hengâme var. Ayrıca insanlar geç saatlere kadar oturdukları için sokakta çok ses oluyor.',
      location: LatLng(41.049802, 29.004121),
      fullAddress:
          " Cihannüma, Dört Yüzlü Çeşme Sk., 34353 Beşiktaş/İstanbul, Türkiye",
      shortAddress: "Abbasağa Mah. Beşiktaş/Istanbul",
      dateTime: DateTime.now(),
      imageUrl:
          "https://pbs.twimg.com/media/DebikThX4AACAeL?format=jpg&name=4096x4096",
      upVote: 185,
    ),
    Complain(
      username: 'Hasan K.',
      complainTopic: 'Yanıp Sönen Işıklar',
      complain:
          ' Herkese iyi günler, Her gün işe giderken geçtiğim Beylikdüzü Cumhuriyet Caddesi’ndeki kavşakta yanıp sönen ışıklar büyük tehlike yaratıyor. Hem insanlar orada çok vakit kaybediyor hem de birçok kazaya sebebiyet veriyor. Buradaki ışıklara bir düzenleme gelmesini talep ediyorum.',
      location: LatLng(41.007438, 28.641108),
      fullAddress:
          " Cumhuriyet, Şht. Raif Esmertaş Sk. 10 C, 34520 Beylikdüzü Osb/Beylikdüzü/İstanbul, Türkiye",
      shortAddress: "Cumhuriyet Mah. Beylikdüzü/Istanbul",
      dateTime: DateTime.now(),
      imageUrl:
          "https://i.sozcu.com.tr/wp-content/uploads/2018/02/iecrop/kaza-487_16_9_1519715016.jpg",
      upVote: 168,
      replied: true,
    ),
    Complain(
      username: 'Fatih E.',
      complainTopic: 'Park Sorunu',
      complain: 'Kadiköydeki oyun parklarındaki oyuncaklar kırık ve bakımsız',
      location: LatLng(40.990307, 29.0298),
      fullAddress:
          "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      imageUrl:
          "https://www.haberankara.com/images/haberler/2016/09/ankara-ya-yakismiyor-cocuk-parki-demeye-bin-sahit.jpg",
      upVote: 157,
    ),
    Complain(
      username: 'Ahmet A.',
      complainTopic: 'Sokak hayvanları',
      complain: 'Sokak hayvanları geceleri çok ses çıkarıyor.',
      location: LatLng(40.990307, 29.0298),
      fullAddress:
          "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
      shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 152,
    ),
    Complain(
      username: 'Selinay P.',
      complainTopic: 'Asfalt Sorunu',
      complain:
          ' Pınar Mahallesi’nden çevreyoluna çıkan yolun asfaltı ne zaman yenilenecek acaba? Ben bu kadar kullanılıp da bu kadar bozuk olan başka bir yol daha görmedim…',
      location: LatLng(1, 1),
      fullAddress: "Pınar, Çamlıbel Cd. 39/C, 34460 Sarıyer/İstanbul, Türkiye",
      shortAddress: "Pınar Mah. Sariyer/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      upVote: 146,
    ),
    Complain(
      username: 'Ömer T.',
      complainTopic: 'Saldırgan Köpekler',
      complain:
          'Yaklaşık 20 senedir ikamet ettiğim Üsküdar Kuzguncuk’ta köpek korkusundan sokağa çıkamaz olduk! Bugün yine birini ısırdılar ve bu kaç oldu bilmiyorum. Mahallece tüm komşularımla bu durumdan mustaribiz. Belediye’nin buna bir çözüm getirmesini istiyoruz.',
      location: LatLng(1, 1),
      fullAddress:
          " Kuzguncuk, Meşruta Sk. No:1, 34674 Üsküdar/İstanbul, Türkiye",
      shortAddress: "Kuzguncuk Mah. Üsküdar/Istanbul",
      dateTime: DateTime.now(),
      upVote: 143,
    ),
    Complain(
      username: 'Muhammet Ali K.',
      complainTopic: 'Yanlış Otobüs Saatleri',
      complain:
      ' Herkese merhaba Bugün Levent otobüs duraklarında beklerken ekranın otobüs numara ve saatlerini çok yanlış gösterdiğini fark ettim. Burası çok kullanılan bir durak ve yabancılar da çok. Bence insanlar daha fazla yanlış yönlendirilmeden düzeltilmesi gerekiyor.',
      location: LatLng(1, 1),
      fullAddress: "Levent, Levent Cd., 34330 Beşiktaş/İstanbul, Türkiye ",
      shortAddress: "Levent Mah. Beşiktaş/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      solved: true,
      upVote: 139,
    ),
    Complain(
        username: 'Fatih E.',
        complainTopic: 'Çöpler toplanmıyor',
        complain: 'Belediye çöpleri toplamıyor',
        location: LatLng(40.990307, 29.0298),
        fullAddress:
            "Kadıköy Bull Statue, Osmanağa, Söğütlü Çeşme Caddesi, Kadıköy/İstanbul",
        shortAddress: "Osmanağa mah. Kadiköy/Istanbul",
        dateTime: DateTime.now(),
        replied: true,
        solved: true,
        upVote: 133),
    Complain(
      username: 'Ahmet A.',
      complainTopic: 'Kanalizasyon Kokusu',
      complain:
          'Buradan Ümraniye Belediyesi’ne sesleniyorum kokudan öleceğiz artık!!! 2 hafta önce patlayan kanalizasyon borusundan iğrenç bir koku geliyor ve artık buramıza kadar geldi. Her yeri aradık ama 2 haftadır hiç kimseyi göndermediler. Çakmak’tayız acil dönüş bekliyoruz!',
      location: LatLng(41.016099, 29.127563),
      fullAddress: "Çakmak, Varan Cad. No:2, 34774 Ümraniye/İstanbul, Türkiye",
      shortAddress: "Çakmak Mah. Ümraniye/Istanbul",
      dateTime: DateTime.now(),
      upVote: 111,
    ),
    Complain(
      username: 'Şule D.',
      complainTopic: 'Kaba Personeller',
      complain:
          ' Merhaba,Geçen gün bir evrak işi için Büyükşehir Belediyesi’ne gittim. Temizlik personelinize bir birimin yerini sordum diye az daha dayak yiyecektim! Ayrıca girişteki yönlendirmeler bence hiç yeterli değil. Bu duruma bir çözüm bulabilirseniz sevinirim.',
      location: LatLng(41.014100, 28.955254),
      fullAddress:
          "Kemal Paşa, 15 Temmuz Şehitleri Cd No:5 D:5, 34134 Fatih/İstanbul, Türkiye",
      shortAddress: "15 Temmuz Şehitleri Cd. Fatih/Istanbul",
      dateTime: DateTime.now(),
      upVote: 97,
    ),
    Complain(
      username: 'Berk Ş.',
      complainTopic: 'Israrcı Çiçekçiler',
      complain:
          'Merhaba,Kız arkadaşımla ne zaman Kadıköy’de dolaşmak istesek çiçek satıcıları peşimizi bırakmıyor. Artık rahatsızlık seviyesine geldi bu iş bizi takip edip taciz ediyorlar resmen. Almak istemiyoruz lafından anlamıyorlar. Zabıtanın daha aktif çalışmasını talep ediyorum.',
      location: LatLng(40.980297, 29.027683),
      fullAddress:
          "Caferağa, Küçük Moda Sokak No:21, 34710 Kadıköy/İstanbul, Türkiye",
      shortAddress: "Caferağa Mah. Kadıköy/Istanbul",
      dateTime: DateTime.now(),
      replied: true,
      solved: true,
      upVote: 91,
    ),
  ];

  void addNewComplain({
    String username,
    String complainTopic,
    String complain,
    LatLng location,
    DateTime date,
    String imageUrl,
  }) async {
    final newComp = Complain(
      username: username,
      complainTopic: complainTopic,
      complain: complain,
      dateTime: date,
      location: location,
      fullAddress: await LocationUtil.getAddress(location),
      shortAddress: await LocationUtil.getShortAddress(),
      imageUrl: imageUrl,
    );
    _complains.add(newComp);
    //_complains.sort( (Complain c1,Complain c2) => c1.upVote.compareTo(c2.upVote));
    notifyListeners();
  }

  List<Complain> get allComplains {
    List<Complain> complains = [..._complains];
    complains.sort( (a,b) => b.upVote.compareTo(a.upVote));
     return complains;
  }

  List<Complain> get unresolvedComplains {
    return allComplains.where((comp) => !comp.solved && !comp.replied).toList();
  }

  List<Complain> get solvedComplains {
    return allComplains.where((comp) => comp.solved).toList();
  }

  List<Complain> get repliedComplains {
    return allComplains.where((comp) => comp.replied && !comp.solved).toList();
  }
}
