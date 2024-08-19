import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductList extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {

    return _ProductListState();


  }
}


class _ProductListState extends State{

  var dbHelper =  DbHelper();
  late List<Product> products;
  int productCount =0;

  @override
  void initState() { //bu sayfadaki statei başlat o sayfanın o an açıldığında çalşması gibi
  var productsFuture = dbHelper.getProducts();
  productsFuture.then((data){ // ilk açıldığında bomboş ekran sonra data doluyo ya o görüntüyü sağlayan yapı bu 
    this.products = data;
     
  });
    super.initState(); //state in initsatatini çalıştır diyo bazı uygulamaları inheritance edeerken yani burdaki state in basit bir şeyini çalıştırmak istersen diye yapılmış bir şey
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi "),
      ),
      body:buildProductList(),
    );
  }
  
  ListView buildProductList() { 

    return ListView.builder(
      itemCount:  productCount,
      itemBuilder:  (BuildContext context , int position){ //elemanları tek tek dolaştığından her seferini bir listeye atıyor o yüzden return diyor 
        return Card (
          color: Colors.cyan,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.black12, child: Text("p"),),
            title: Text(this.products[position].name ?? ""),
            subtitle: Text(this.products[position].description ?? ""),
            onTap: (){

            },

          ),

        );
      }
    );


  }

  
}