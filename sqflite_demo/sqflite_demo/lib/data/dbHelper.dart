import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_demo/models/product.dart';

class DbHelper {
  Database? _db; // Change late to nullable

  Future<Database> get db async {// ilerde çalışcağını kabul etmesi için async ve future ekledik
    if (_db == null) { // İLK KEZ KURDU UYGULAMAYI VERİ TABANI OLUŞMAMIŞ OLUYO ilk kez açıldığı için 
      _db = await initializeDb();//db ye ulaşmamız lazım o yüzden oluşturmak için bunu oluşturduk
    }
    
      return _db!; // Use non-null assertion
  }

  Future<Database> initializeDb() async { // Future asenkron çalışmadır sırayla gitmesini engeller herşeyle çalışabilir
    String dbPath = join(await getDatabasesPath(), "etrade.db"); // veri tabanı yolu oluşturuyoruz dbPath ile, veritabanları yolunu biliyo join birleştirmeye yarıyor
    var eTradeDb = await openDatabase(dbPath, version: 1, onCreate: createDb);//veri tabanı açıyo olucak dbPath, oncreate oluştur diyosun yoksa
    return eTradeDb;
  }

  Future<void> createDb(Database db, int version) async {
    await db.execute( //şu soruguyu bas diyoruz 
        "CREATE table products(id integer primary key, name text, description text, unitPrice integer)");
  }
  //CRUD OPERASYONLARI: 
  Future<List<Product>> getProducts() async { // Bize liste formatında gelmelidir Üürün listesi olarak dönsün
    Database db = await this.db;
    var result = await db.query("products"); 
    return List.generate(result.length, (i) { // map formatından obje formatına çekmek için
      return Product.fromObject(result[i]);
    });
  }

  Future<int> insert(Product product) async {
    Database db = await this.db;
    var result = await db.insert("products", product.toMap());//map formatında gönder diyo 
    return result;
  }

  Future<int> delete(int id) async { // id sini verdiğimiz elemanı siliyor olucaz
    Database db = await this.db;
    var result = await db.rawDelete("delete from products where id = $id"); //string birleştirme oluyor 
    return result;
  }

  //Alttaki format daha güvenilir format
  Future<int> update(Product product) async {
    Database db = await this.db;
    var result = await db.update("products", product.toMap(), //burdaki format daha doğru format delete içinde kullanabiliriz Bütün dattayı güncelliycek
        where: "id = ?", whereArgs: [product.id]); //? parametre anlamına gelir sql içinde kullandığımızda,
    return result;
  }
}
