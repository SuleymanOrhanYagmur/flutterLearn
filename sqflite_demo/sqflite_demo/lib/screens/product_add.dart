import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return ProductAddState();
  }

}

class ProductAddState extends State{
  var dbHelper = DbHelper();
  var  txtName = TextEditingController();
  var  txtDescription = TextEditingController();
  var  txtUnitPrice = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ürün Ekle"),
      ),
      body: Padding( // içindeki nesnelerle olan uzaklığı
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          buildNameField(),buildDescriptionField(),buildUnitPriceField(),buildSaveButton(),
          ],
        ),
        ),
    );
  }
  
  Widget buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Adı"),
      controller: txtName,
    );
  }
  
  Widget buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Ürün Açıklaması"),
      controller: txtDescription,
    );
  }
  
  Widget buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Birim fiyatı"),
      controller: txtUnitPrice, //unitpricea bağladık
    );
  }
  
  buildSaveButton() {
    return TextButton(
      
      onPressed:(){
        addProduct();
      }, 
      
      child: Text('Ekle') ,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.blue,
        padding: EdgeInsets.all(16.0),
      ),
      );
  }
  
  void addProduct() async {
    var result=   await dbHelper.insert(Product(name: txtName.text, description: txtDescription.text,unitPrice:  double.tryParse(txtUnitPrice.text)));
    // soonuç veritabannına eklendi geriye yazdır anlamındaki result
    Navigator.pop(context,true); //bir önceki sayfaya git diyoruz
  }

}