  import 'package:dartdeneme/dartdeneme.dart' as dartdeneme;

  void main () {
    List<String> sehirler = List.filled(3, "");  // Boş stringlerle doldurulmuş sabit uzunlukta liste  

    //List<String> sehirler = new List<String> (3); konseptinde artık dartta hata alaiblirsin kullanulmıyor
    sehirler[0] = "İstanbul";
    sehirler[1] = "İZMİR";
    sehirler[2] ="Ankara";
    print(sehirler);

    List urunler = ["Laptop","Mouse","Keyboard"];
    print(urunler);


    var product1 = Product("TV",500);
    var product2 = Product("Bilgisayar",120);
    List<Product> product = [product1,product2];
    print(product); // Instance of product çıktısı verdi 
    print(product[0].name + " " + product[0].unitPrice.toString()); //0. elemanın adını bastır + rakam olduğu için sonuna toString fonk koyduk
  }

  class Product {
    late String name; // Kullanım olarak late kullandım çünkü normal kullanımda dart dili hata verdi null değerler olduğu olabildiği için

    late double unitPrice;

    Product(String name, double unitPrice) {
      this.name = name;
      this.unitPrice = unitPrice;
    }
  }