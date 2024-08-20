import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print("ProductList Widget State oluşturuluyor");
    return _ProductListState();
  }
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
  late List<Product> products = [];
  int productCount = 0;

  @override
  void initState() {
    super.initState();
    print("initState çağrıldı");

    // Başlangıçta bir ürün ekliyoruz
    dbHelper.insert(Product(name: "Örnek Ürün", description: "Bu bir açıklamadır", unitPrice: 100.0)).then((_) {
      print("Örnek ürün veritabanına eklendi");

      var productsFuture = dbHelper.getProducts();
      productsFuture.then((data) {
        setState(() {
          this.products = data;
          this.productCount = data.length;
          print("Ürünler alındı ve state güncellendi, ürün sayısı: $productCount");
        });
      }).catchError((error) {
        print("Ürünler getirilirken hata: $error");
      });
    }).catchError((error) {
      print("Ürün eklenirken hata: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build metodu çağrıldı");

    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi "),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Yeni Ürün Ekle butonuna tıklandı");
          goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  ListView buildProductList() {
    print("buildProductList metodu çağrıldı");

    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int position) {
        if (products.isEmpty) {
          print("Ürün listesi boş, boş mesaj gösteriliyor");
          return Center(child: Text("Henüz Ürün Yok "));
        }
        print("Ürün listesi oluşturuluyor, position: $position");

        return Card(
          color: Colors.cyan,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Text("P"),
            ),
            title: Text(products[position].name ?? ""),
            subtitle: Text(products[position].description ?? ""),
            onTap: () {
              print("Ürün tıklandı: ${products[position].name}");
            },
          ),
        );
      },
    );
  }

  void goToProductAdd() async {
    //await Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductAdd()));
    print("goToProductAdd fonksiyonu çağrıldı");
  }
}
