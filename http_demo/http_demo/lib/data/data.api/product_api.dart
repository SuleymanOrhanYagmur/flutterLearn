import 'package:http/http.dart' as http; // bi sürü refferans var direkt http ile erişebiilirsiniz diyosun
class ProductApi {
  static Future getProducts(){
    return http.get(Uri.parse("http://10.0.2.2:3000/products")); // ben bu veriyi istiyorum diyosun
  }



  static Future getProductsByCategoryId(int categoryId) {

    return http.get(Uri.parse("http://10.0.2.2:3000/products?categoryId=$categoryId"));
  }
}



// DATAYI İSTİYOSAN URL İÇİN JSON SERVER APİ vardı cmd de şunu yazdık json-server --watch db.json 
// url ise şu : http://localhost:3000/products
// bu servis kendi pcm de çalışıyor,  bu isteği yapan yer emulatör farklı api adresleri kullanıyor bu localhost emulatörün oluyo bu doğru değil emulatörün kendi adresi olan 
//10.0.2.2 kulllanır onu yazıyoruz o yüzden