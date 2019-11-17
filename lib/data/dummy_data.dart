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
    'Yeni yapılan bir parkta farklı olarak aşağıdakilerden hangisini görmek isterdiniz?',
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
    ),
    QuestionAnswer(
      answer: '10-20  dk ',
      choice: 'B)',
      selected: false,
      button: true,
    ),
    QuestionAnswer(
      answer: '20-40  dk ',
      choice: 'C)',
      selected: false,
      button: true,
    ),
  ],
  'Sık gittiğiniz parkın adını ve mahallesini yazar mısınız?': [
    QuestionAnswer(
      input: true,
    )
  ],
  'Yeni yapılan bir parkta farklı olarak aşağıdakilerden hangisini görmek isterdiniz?':
      [
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/5Ic6Zvzp1PSfYfUG98T7Gf6v92snk_9WYM3c5ZPj1iotXE2qR4clHYNf0Q732G9KO_0b=s153',
      selected: false,
      answer: 'Kırık oyuncaklar',
      image: true,
      choice: 'A)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://www.google.com.tr/search?sa=G&hl=tr&sxsrf=ACYBGNQDHzSVAQtPjKVqMjFsPF3PKX1DRg:1573988372093&q=%E3%83%9A%E3%83%83%E3%83%88+%E3%83%9E%E3%83%8A%E3%83%BC+%E3%82%A4%E3%83%A9%E3%82%B9%E3%83%88&tbm=isch&tbs=simg:CAQSkwEJYMNl7YkwekIahwELEKjU2AQaAAwLELCMpwgaYgpgCAMSKOkTgRSaA8IImwP6CesTngbAFLwH8j2oNJg1lSTxPa80jyyXNbY0pzQaMFMbwvpL2fIyW9NFtXk7O5o4-XFkeB5eGwqyUimoRkeVcvkpuy6ZTpRdUoXZsWox6SAEDAsQjq7-CBoKCggIARIETScmaAw&ved=0ahUKEwidhLLOi_HlAhWnwsQBHasqADwQwg4ILSgA',
      selected: false,
      answer: 'Evcil hayvan dışkısı',
      image: true,
      choice: 'B)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://www.google.com.tr/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&ved=2ahUKEwjtxrfli_HlAhVKbVAKHRmOBKgQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.sondakikahaberleri.info.tr%2Fasgari-ucret%2F6&psig=AOvVaw3RupjHBvoJ5N0zJXFcS10r&ust=1574074818411623',
      selected: false,
      answer: 'Sosyal Güvenlik Eksikliği',
      image: true,
      choice: 'C)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://www.google.com.tr/search?sa=G&hl=tr&sxsrf=ACYBGNRNRMKpgyMiVVAbNnIDYkyuWOBaOw:1573988656798&q=grove&tbm=isch&tbs=simg:CAQSkwEJqblLdGhC4UoahwELEKjU2AQaAAwLELCMpwgaYgpgCAMSKKoV_1wrdFckVwxXeFfoK1BW6FYMehjmIP_1Y59DmMP6kq9znrPpA_11jcaMOX0bjRSXKjHXd_17k5FxIBN9MTOcYN3u07kQ62AL5Oa_1twdHKnPXKizDQqQWLGnG1CAEDAsQjq7-CBoKCggIARIEACynFQw&ved=0ahUKEwi2hpPWjPHlAhUD5aYKHUxeBa8Qwg4ILSgA&biw=648&bih=639',
      selected: false,
      answer: 'Genel Temizlik',
      image: true,
      choice: 'D)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/MIiWU7Aqb1FmYp-SIbz9S_OTTnSTcpMkgNzspvbefhtvsyF3gyKvBk5AQRxBoU3jdHcRxQ=s128',
      selected: false,
      answer: 'Bahçe, bitki bakımı',
      image: true,
      choice: 'F)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/MIiWU7Aqb1FmYp-SIbz9S_OTTnSTcpMkgNzspvbefhtvsyF3gyKvBk5AQRxBoU3jdHcRxQ=s128',
      selected: false,
      answer: 'Bahçe, bitki bakımı',
      image: true,
      choice: 'G)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://www.google.com.tr/search?sa=G&hl=tr&sxsrf=ACYBGNQcUDnBI504BYhxlsoodvYggmR-Qw:1573988775820&q=%C3%A7ardak+modelleri&tbm=isch&tbs=simg:CAQSkwEJ5I6vsQtXyfkahwELEKjU2AQaAAwLELCMpwgaYgpgCAMSKOkK_1wP3FPYU3RTzFLsK0BboCvQUwyrCKvgqizmCOcYq_1TjRKfQq8yoaMCAZnp6rP116R1LTJ-nt2IZYavOhz23OaG5bJYqkciEeRzMNcX-X9jxCxvR_1wz0zFSAEDAsQjq7-CBoKCggIARIEwV_1Lwww&ved=0ahUKEwj5wPOOjfHlAhXvwcQBHexwBbMQwg4ILSgA',
      selected: false,
      answer: 'Oturacak alan eksikliği',
      image: true,
      choice: 'H)',
    ),
    QuestionAnswer(
      imageUrl:
          'https://lh3.googleusercontent.com/eDd7Yh111WB9577Dh_Som7JuWINUw_Ih82TRHMQ_SX8o1kwLvJO5D9xYMSIrgaRESisAnA=s128',
      selected: false,
      answer: 'Yetişkinlere yönelik bozuk egzersiz aletleri',
      image: true,
      choice: 'I)',
    ),
  ],
  'Yeni yapılan bir parkta farklı olarak aşağıdakilerden hangisini görmek isterdiniz?':
      [
    QuestionAnswer(
      answer:
          'Tırmanma duvarı, fiziksel hareket parkurları gibi çocuklara yönelik yeni oyuncaklar',
      button: true,
      choice: 'A)',
    ),
    QuestionAnswer(
      answer: 'Su gösterisi havuzları',
      button: true,
      choice: 'B)',
    ),
    QuestionAnswer(
      answer: 'Yetişkinlere yönelik daha etkili egzersiz aletleri',
      button: true,
      choice: 'C)',
    ),
    QuestionAnswer(
      answer: 'Kaykay, paten parkurları',
      button: true,
      choice: 'D)',
    ),
    QuestionAnswer(
      answer: 'Mega satranç, canlı langırt, trambolin gibi eğlence alanları',
      button: true,
      choice: 'F)',
    ),
  ],
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
