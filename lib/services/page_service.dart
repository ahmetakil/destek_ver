class PageService{


  List<String> appBarTitles = [
    "DestekVer",
    "Anketler",
    "Şikayet Ekle",
    "Öneri Ekle",
    "Profilim"
  ];


  int selectedPage = 0;

  void setPage(int newPage){
    selectedPage = newPage;
  }


}