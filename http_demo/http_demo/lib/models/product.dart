class Product {
  int id;
  int categoryId;
  String productName;
  String quantityPerUnit;
  double unitPrice;
  int unitsInStock;

  Product(this.id, this.categoryId, this.productName, this.quantityPerUnit,
      this.unitPrice, this.unitsInStock);

  Product.fromJson(
      Map json) // bu kullanıldığında alanlar başlatılmamış BU YÜZZDEN {} KULLANMADAN : ile yazdık böylece
      //id,categoryName, seoUrl alanları Category.fromJson constructorunda diğer kodlar çalışmadan önce başlatılır. Bu satede,nullable olmayan alanlar her zaman bir değerle başlatılmış olur
      : id = json["id"],
        categoryId = json["categoryId"],
        productName = json["productName"],
        quantityPerUnit = json["quantityPerUnit"],
        unitPrice = json["unitPrice"] != null ? double.tryParse(json["unitPrice"].toString()) ?? 0.0 : 0.0,
        unitsInStock = json["unitsInStock"];

  Map toJson() {
    return {
      "id": id,
      "categoryId": categoryId,
      "quantityPerUnit": quantityPerUnit,
      "unitPrice": unitPrice,
      "unitsInStock": unitsInStock
    };
  }
}
