import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http_demo/data/data.api/category_api.dart';
import 'package:http_demo/data/data.api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen>  {
  List<Category> categories = [];
  List<Widget> categoryWidgets = []; // sonra bu liste değiştiği anda 
  List<Product> products = [];
  @override
  void initState() {
    getCategoriesFromApi();

    super.initState();
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Alışveriş Sistemi",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blueGrey,
      centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoryWidgets,
            ),
          ),
          Expanded(
            child: ProductListWidget(products), // Expanded ile sararak boyutlandırıyoruz
          ),
        ],
      ),
    ),
  );
}


  void getCategoriesFromApi() { // ÖNCE APİDEN LİSTEMİZİ OLUŞTURDUK LİSTE"
    //void apiden datayı çekicem elimdeki kategorilere map liyor olucam
    CategoryApi.getCategories().then((response) {
      // category api elimde vrdı operasyonu statik verdiğim için oldu otomatik ilk kez bellekte oluşur aynı instance örnek bellekten tüketilir
      // Bu tip datalar ekrana yansıyabilmesi için setstate kullan
      print("Response Body: ${response.body}"); // Gelen yanıtı konsola yazdırın
      setState(() {
        Iterable list = json.decode(response.body); //map formatına çekicek
        this.categories = list
            .map((category) => Category.fromJson(category))
            .toList(); // bütün elemanları tek tek dolaşıp yep yni bi listeye atıyor
        getCategoryWidgets(); //categoriesleri tek tek dolaşıp her birinin flap botton haline getirilmesini sağlamak amaç
      });
    });
  }

  void getCategoryWidgets() { // HER BİRİ WİDGETE DÖNÜŞMESİ İÇİN TEK TEK DÖNDÜ KATEGORİLER flap button listesine çekiyor olucaz o yüzden liste geri döndürücez
// her bir eleman için bir tane flatbutton oluşturdun bunları listeye ADD lemiş oldun 
    setState(() {
      categoryWidgets.clear(); // Önceki widget'ları temizle
      for (var category in categories) {
        categoryWidgets.add(getCategoryWidget(category));
      }
    });
  }

  Widget getCategoryWidget(Category category) {
    return TextButton(
      child: Text(
        category.categoryName,
        style: TextStyle(color: Colors.blueGrey),
      ),

      style: TextButton.styleFrom( 
        shape: RoundedRectangleBorder( //shape kulllanımı değişmiş böyle kullanılıyor Oval köşeleri olan yapı kullanılıyor
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.lightGreenAccent),
        ),
      ), 
      onPressed: () { 
        getProductByCategoryId(category);

       },
    );
  }
  
  void getProductByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product)=>Product.fromJson(product)).toList();

      });

    });
  }
}
