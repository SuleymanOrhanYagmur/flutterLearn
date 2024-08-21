import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';
import 'package:sqflite_demo/screens/product_add.dart';
import 'package:sqflite_demo/screens/product_detail.dart';

class ProductList extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {

    return _ProductListState();


  }
}


class _ProductListState extends State<ProductList>{
  
  DbHelper dbHelper =  DbHelper();
  late List<Product> products;
  int productCount =0;

 
 @override
void initState() { // özel bir fonksiyon uygulama çalıştığında çalışıyor o yüzden bunu aşağıda bir daha çağırmamız lazım
  
  
  // Bu kodu initState'e ekleyerek başlangıçta bir ürün ekleyebilirsiniz.


  getProducts();
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: Text("Ürün Listesi "),
        
      ),
      body:buildProductList(),//buildproductlist döndür bana diyosun 
      floatingActionButton: FloatingActionButton(
        onPressed: (){ // onPressed buna tıkladnığında ne olsun 
          goToProductAdd();
        },
        child: Icon(Icons.add), // + tuşu 
        tooltip: "Yeni Ürün Ekle",// kullanıcı yönlendirmek için 
        
      ),
    );
  }
  
  ListView buildProductList() { 

    return ListView.builder(
      itemCount:  productCount,
      itemBuilder:  (BuildContext context , int position){ //elemanları tek tek dolaştığından her seferini bir listeye atıyor o yüzden return diyor 
      /*if(products.isEmpty){
        return Center(child: Text("Henüz Ürün Yok "));
      }*/
        return Card (
          color: Colors.cyan,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.black12, child: Text("p"),),
            title: Text(products[position].name ?? ""),
            subtitle: Text(products[position].description ?? ""),
            onTap: (){ goToDetail(this.products[position]);

            },

          ),

        );
      }
    );


  }
  
void goToProductAdd() async {
  final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => ProductAdd()));
  
  if (result == true) { // Null kontrolüne gerek kalmıyor, sadece true kontrolü yapılıyor
    getProducts();
  }
}




  void getProducts() async{

    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
    setState(() {
      this.products = data;
      productCount = data.length;
    });

   } );
}

  void goToDetail(Product product) async{

    bool result = await Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetail(product)));
    if(result !=null){
      if(result) {
        getProducts();
      }
    }
  }

}