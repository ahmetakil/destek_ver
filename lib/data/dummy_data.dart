import '../models/question_answer.dart';

const List<String> SURVEY_TYPES = [
  'Park ve Bahçeler',
  'Sokak Hayvanları',
];

const Map<String, List<String>> QUESTIONS = {
  'Park ve Bahçeler': [
    'Aşağıda bulunan hangi park konseptini seçersiniz?',
    'İlçenizdeki sıklıkla gittiğiniz parka ne kadar sürede ulaşım sağlıyorsunuz?',
    'Sık gittiğiniz parkın adını ve mahallesini yazar mısınız?',
    'Sıklıkla gittiğiniz parkın size göre en büyük sorunları işaretleyiniz. ',
  ],
  'Sokak Hayvanları': [
    'Yaşadığınız mahalledeki sokak hayvanlarından ne kadar rahatsızsınız?',
    'Sizce mahallenizdeki sokak hayvanlarının aşıları düzenli yapılıyor mu?',
    'Yaşadığınız mahalledeki hayvanların kısırlaştırılması fikrine ne kadar katılıyorsunuz?',
  ]
};

Map<String, List<QuestionAnswer>> ANSWERS = {
  'Aşağıda bulunan hangi park konseptini seçersiniz?': [
    QuestionAnswer(
      imageUrl:
          'https://iasbh.tmgrup.com.tr/7fa563/800/420/0/0/660/345?u=https://isbh.tmgrup.com.tr/sbh/2018/09/29/istanbulda-kosu-yapilacak-en-iyi-yerler-istanbul-kosu-parkuru-yerleri-1538207897481.jpg',
      selected: false,
      choice: 'A)',
      image: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/XCm7WI7HwkNso9hrdCpQuDkwAw2Y_oMMUUPG8eEmY5y4votLM6hYNIzSJE-GfjJBserfxak=s170',
      selected: false,
      choice: 'B)',
      image: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/g1dF8mWvwx-FDE7T7yx4X8Ur_cyyDhvurGUDdjZ4TkB7BbkZVU2d4hirC4kyu09cKhcY=s128',
      selected: false,
      choice: 'C)',
      image: true,
    ),
  ],
  'İlçenizdeki sıklıkla gittiğiniz parka ne kadar sürede ulaşım sağlıyorsunuz?':
      [
    QuestionAnswer(
      answer: '0-10  dk ',
      choice: 'A)',
      selected: false,
      button: true,
      image: false,
    ),
    QuestionAnswer(
      answer: '10-20  dk ',
      choice: 'B)',
      selected: false,
      button: true,
      image: false,
    ),
    QuestionAnswer(
      answer: '20-40  dk ',
      choice: 'C)',
      selected: false,
      button: true,
      image: false,
    ),
  ],
  'Sık gittiğiniz parkın adını ve mahallesini yazar mısınız?': [
    QuestionAnswer(
      input: true,
    )
  ],
  'Sıklıkla gittiğiniz parkın size göre en büyük sorunları işaretleyiniz. ': [
    QuestionAnswer(
      imageUrl:
          'https://www.haberankara.com/images/haberler/2016/09/ankara-ya-yakismiyor-cocuk-parki-demeye-bin-sahit.jpg',
      selected: false,
      answer: 'Kırık Oyuncaklar',
      image: true,
      choice: 'A)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://previews.123rf.com/images/arcady31/arcady311706/arcady31170600050/80089514-dog-pooping-vector-symbol.jpg',
      selected: false,
      answer: 'Evcil Hayvan Dışkısı',
      image: true,
      choice: 'B)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://www.aydinlik.com.tr/_usr/files/img/2018032612363519_imll700d3m044anbd8h6otbde31.jpg',
      selected: false,
      answer: 'Sosyal Güvenlik Eksikliği',
      image: true,
      choice: 'C)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl:
          'http://www.yarin11.com/images/upload/image/2016%20Mart/pispark%204.png',
      selected: false,
      answer: 'Genel Temizlik',
      image: true,
      choice: 'D)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://blog.gittigidiyor.com/wp-content/uploads/sites/13/2017/07/yaz-bahce-bakimi-gittigidiyor-blog-1.jpg',
      selected: false,
      answer: 'Bahçe, Bitki Bakımı',
      image: true,
      choice: 'F)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl: 'https://www.as3ahsap.com/img/urunler/kamelya-as612-0.jpg',
      selected: false,
      answer: 'Oturacak Alan Eksikliği',
      image: true,
      choice: 'G)',
      multipleChoice: true,
    ),
    QuestionAnswer(
      imageUrl:
          'https://fazzlamesai.files.wordpress.com/2017/06/28062017-4.jpg',
      selected: false,
      answer: 'Yetişkinlere Yönelik Bozuk Egzersiz Aletleri',
      image: true,
      choice: 'H)',
      multipleChoice: true,
    ),
  ],
  // 'Yeni yapılan bir parkta farklı olarak aşağıdakilerden hangisini görmek isterdiniz?':
  //     [
  //   QuestionAnswer(
  //     answer:
  //         'Tırmanma duvarı, fiziksel hareket parkurları gibi çocuklara yönelik yeni oyuncaklar',
  //     button: true,
  //     choice: 'A)',
  //   ),
  //   QuestionAnswer(
  //     answer: 'Su gösterisi havuzları',
  //     button: true,
  //     choice: 'B)',
  //   ),
  //   QuestionAnswer(
  //     answer: 'Yetişkinlere yönelik daha etkili egzersiz aletleri',
  //     button: true,
  //     choice: 'C)',
  //   ),
  //   QuestionAnswer(
  //     answer: 'Kaykay, paten parkurları',
  //     button: true,
  //     choice: 'D)',
  //   ),
  //   QuestionAnswer(
  //     answer: 'Mega satranç, canlı langırt, trambolin gibi eğlence alanları',
  //     button: true,
  //     choice: 'F)',
  //   ),
  // ],
  'Yaşadığınız mahalledeki sokak hayvanlarından ne kadar rahatsızsınız?': [
    QuestionAnswer(
      answer: '1:Çok Rahatsızım , 5:Hiç Rahatsız Değilim',
      star: true,
    ),
  ],
  'Sizce mahallenizdeki sokak hayvanlarının aşıları düzenli yapılıyor mu?': [
    QuestionAnswer(
      answer: 'Evet',
      choice: 'A)',
      button: true,
    ),
    QuestionAnswer(
      answer: 'Hayır',
      choice: 'B)',
      button: true,
    ),
    QuestionAnswer(
      answer: 'Bilgim Yok',
      choice: 'C)',
      button: true,
    ),
  ],
  'Yaşadığınız mahalledeki hayvanların kısırlaştırılması fikrine ne kadar katılıyorsunuz?':
      [
    QuestionAnswer(
      answer: '1:Kesinlikle Katılıyorum , 5:Hiç Katılmıyorum',
      star: true,
    )
  ]
};
