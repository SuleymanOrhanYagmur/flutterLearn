import 'package:block_sample/models/cart.dart';

class CartService {
  static List<Cart> cartItems = [];

  static CartService _singLeton = CartService._internal();

  factory CartService (){
    return _singLeton;
  }

  CartService._internal();

  static void addToCart(Cart item){ 
    cartItems.add(item);

  }

  static void removeCart(Cart item) {
    cartItems.remove(item);
  }

  static List<Cart> getCart() {
    return cartItems;

  }


}