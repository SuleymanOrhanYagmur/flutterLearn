import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/models/product.dart';

class DbHelper {


  
  late Database _db;
  Future<Database> get db async { //asenkron çalışabillmesi için Future ile ilerde yapıcağımız işlemleri yapıyoruz gibi 

    if(_db == null) {
      _db = await initializeDb(); //await demek benim için aşağıdaki initializeDb çalışması önemli onuniçin sen bi bekle diyosun
    }

    return _db;
  }
// asenkron çalışmalar herşey sıralı giderken asenkronda yeni bi operasyon başka hatta çalışabiliyor 


  
  Future<Database> initializeDb() async{
    String dbPath = join(await getDatabasesPath(),"etrade.db"); // sqflight feri tabanlarının yolunu veriyo olucak
    //future streing asenkrona atıyosun diye await ekledik 
    //join ilgili cihaza göre veriyor
    var eTradeDb = await openDatabase(dbPath,version: 1,onCreate: createDb);
    return eTradeDb;
  }

  Future<void> createDb(Database db, int version) async {
    await db.execute("Create Table products(id integer primary key, name text, description text, unitPrice integer)"); //tablo ismi ve alanları veriyoruz

  }


  Future<List> getProducts() async {
    Database db = await this.db;
    var result = await db.query("products");
    return result;
  }

  Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert("products", product.toMap());//string kolunun türü dynamic string alan dobule alan gibi map istiyor
    return result;
  }


}
