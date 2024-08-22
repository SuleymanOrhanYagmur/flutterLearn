import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductDetail  extends StatefulWidget{

  final Product product;
  ProductDetail(this.product);
  
  @override
  State<StatefulWidget> createState() {
    
    return _ProductDetailState(product);
  } 

  

}

enum Options{delete,update}// seçenekleri barındırıyor olucak

class _ProductDetailState extends State<ProductDetail>{
  final Product product;
  _ProductDetailState(this.product);

  final DbHelper dbHelper =DbHelper();
 
  var  txtName = TextEditingController();
  var  txtDescription = TextEditingController();
  var  txtUnitPrice = TextEditingController();

  @override
  void initState() {
    
    txtName.text = product.name!;
    txtDescription.text = product.description!;
    txtUnitPrice.text =  product.unitPrice.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Detayı: ${product.name}"),
        actions: <Widget>[
          PopupMenuButton <Options>(
            onSelected: selectProcess, // napıcağını seçiyor bi kontrol için printf verirdik 
            itemBuilder: (BuildContext context)=><PopupMenuEntry<Options>>[
              PopupMenuItem<Options>(
                value:Options.delete,
                child: Text("Sil"),
              ),
              PopupMenuItem<Options>(
                value: Options.update,
                child: Text("Güncelle"),
              ), 
            ],
           ),
        ],
      ),
      body: buildProductDetail(),

    );
   
  }
  
  buildProductDetail() {
    return Padding( // içindeki nesnelerle olan uzaklığı
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
          buildNameField(),buildDescriptionField(),buildUnitPriceField()
          ],
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

  void selectProcess(Options value) async {
    switch(value) {
      case Options.delete:
      await dbHelper.delete(product.id!);
      Navigator.pop(context,true);
      break;

      case Options.update:
      await dbHelper.update(Product.withId(
        id: product.id,
        name: txtName.text,
        description: txtDescription.text, 
        unitPrice: double.tryParse(txtUnitPrice.text)));
      Navigator.pop(context,true); // geri gittiği noktada listede gotodetail falanla son halini güncelliyoruz
      break;
      default:

    }
  }
}
