import 'package:http/http.dart' as http;

class CategoryApi {
  static Future getCategories() {
    return http.get(Uri.parse("http://10.0.2.2:4000/categories")); // Emülatör için doğru URL
  }
}
