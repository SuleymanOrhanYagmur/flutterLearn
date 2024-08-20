class Product{
  int? id;  // Ürünün benzersiz kimliği (nullable - null olabilir)
  String? name;  // Ürünün adı (nullable - null olabilir)
  String? description;  // Ürünün açıklaması (nullable - null olabilir)
  double?  unitPrice;  // Ürünün birim fiyatı (nullable - null olabilir)


  // Parametreli kurucu (id olmadan)
  Product({this.name, this.description,this.unitPrice});

  // Parametreli kurucu (id ile birlikte)
  Product.withId({this.id,this.name,this.description,this.unitPrice});

  // Nesneyi haritaya (Map) dönüştüren metot
  Map<String,dynamic> toMap() { // map döndürmesi için yazdık 

    var map = Map<String,dynamic>();  // Boş bir Map oluşturuluyor
    map["name"] = name;  // Ürünün adı Map'e ekleniyor
    map["description"]  = description;  // Ürünün açıklaması Map'e ekleniyor
    map["unitPrice"] = unitPrice;  // Ürünün birim fiyatı Map'e ekleniyor
    if(id != null ) {  // Eğer id değeri null değilse 
      map["id"] = id;  // id de Map'e ekleniyor

    }
       return map;  // Map geri döndürülüyor

   }

   Product.fromObject(dynamic o) {

    this.id = int.tryParse(o["id"]);
    this.name = o["name"];
    this.description = o["description"];
    this.unitPrice = double.tryParse(o["unitPrice"]);
  


   }
}


