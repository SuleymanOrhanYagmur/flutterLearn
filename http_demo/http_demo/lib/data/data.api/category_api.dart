import 'package:http/http.dart' as http; // bi sürü refferans var direkt http ile erişebiilirsiniz diyosun
class CategoryApi {
  static Future getcategory(){
    return http.get(Uri.parse("http://10.0.2.2/categories")); // ben bu veriyi istiyorum diyosun
  }
}