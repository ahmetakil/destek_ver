class PageService{


  List<String> appBarTitles = [
    "DestekVer",
    "DestekVer ~ Anketler",
    "DestekVer ~ Yeni Şikayet",
    "DestekVer ~ Yeni Öneri",
    "DestekVer"
  ];


  int selectedPage = 0;

  void setPage(int newPage){
    selectedPage = newPage;
  }


}