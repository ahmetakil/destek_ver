class PageService{


  List<String> appBarTitles = [
    "DestekVer",
    "Anketler",
    "Yeni Şikayet",
    "Yeni Öneri",
    "DestekVer"
  ];


  int selectedPage = 0;

  void setPage(int newPage){
    selectedPage = newPage;
  }


}