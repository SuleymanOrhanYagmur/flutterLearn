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


  Future<List<Product>> getProducts() async { // tüm ürünleri getirmek için  BANA LİSTE DEĞİLDE ÜRÜN LSTESİ OLARAK DÖNSÜN DİYE PRODUCT EKLEDİK
    Database db = await this.db; // database ulaşmam için  (operasyon olduğu için await deidğinde işlem biticek asenkron için)
    var result = await db.query("products"); // db. dediğinde query sorgu yazabilceğin operasyon O tablo ismindeki tüm datayı sana getiriyim diyor 
    return List.generate(result.length,(i){
      return Product.fromObject(result[i]);//bir product oluşturuyo constructor bu ilk değerle her bir mapi gezdiğinde yeni ürün oluşturuyo onlar listeye eklenip dönüştürülüyo
    });
    
    /*List.generate(result.length, (i){ // OBJE FORMATINA DÖNÜŞTÜRÜYORUZ generate denen operasyon kullandık lisstwview gibi düşün, 
      return Product(  //bir product oluştur şunlar olsun gibi
        id:result[i]["id"],name: result[i]["name"],
      );
    }); // liste döndürüyor 
    Bu yukardakini tercih etmiyor bunun yerine bi map oluşturup onla halletsin bunla hepsini geziyo sonra listeye atıyor
    */
  }

  Future<int> insert(Product product) async {// ekleme gibi 1 kayıt eklendi 0 eklenemedi anlamak için int türünde yapıldı 
    Database db = await this.db;// database ihtiyacım var o yüzden
    var result = await db.insert("products", product.toMap());//string kolunun türü dynamic string alan dobule alan gibi map istiyor
    return result; // producta ekliycen value istyiyo 1. tablo 2. parametre Map formatında ver diyo string ve dynamic string kolon adı 
    // dynamictede ona göre string double gibi bi alan istiyor
  } //to map yazdıktan sonra product nesnesine döndük

  Future<int> delete(int id) async {
    Database db = await this.db;// database ihtiyacım var o yüzden
    var result = await db.rawDelete("delete from products where id= $id"); // $ + demekle aynı şey
    return result; 
    
  } 

  Future<int> update(Product product) async { 
    Database db = await this.db;// database ihtiyacım var o yüzden

    var result = await db.update("products",product.toMap(), where: "id=?",whereArgs: [product.id]); // ? mysql içinde parametre anlamında gelir sorgu içinde kullandğımızda  
    return result; 
    
  } 


}
