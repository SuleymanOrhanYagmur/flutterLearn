import 'package:block_sample/models/product.dart';

class ProductService {
  static List<Product> products =[];

  static ProductService _singLeton =  ProductService._internal();

  factory ProductService(){ // arka planda instance oluşturuyo 
    return _singLeton;

  }
  ProductService._internal();

  static List<Product> ?getAll() {
    products.add(new Product(1, "Monser Laptop", 6000));
    products.add(new Product(2, "Asus Laptop", 2000));
    products.add(new Product(3, "Macbook Laptop", 3000));
    return products;
  }
}