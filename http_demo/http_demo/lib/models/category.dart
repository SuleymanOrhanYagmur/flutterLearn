class Category {
  int id;
  String categoryName;
  String seoUrl;

  Category(this.id, this.categoryName, this.seoUrl);

  Category.fromJson(
      Map json) // bu kullanıldığında alanlar başlatılmamış BU YÜZZDEN {} KULLANMADAN : ile yazdık böylece
      //id,categoryName, seoUrl alanları Category.fromJson constructorunda diğer kodlar çalışmadan önce başlatılır. Bu satede,nullable olmayan alanlar her zaman bir değerle başlatılmış olur
      : id = json["id"],
        categoryName = json["categoryName"],
        seoUrl = json["seoUrl"];

  Map toJson() {
    return {"id": id, "categoryName": categoryName, "seoUrl": seoUrl};
  }
}
