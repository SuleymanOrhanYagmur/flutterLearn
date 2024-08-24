import 'dart:async';

import 'package:block_sample/data/cart_service.dart';
import 'package:block_sample/models/cart.dart';

class CartBloc {
  final cartStreamController = StreamController.broadcast(); //final ilk oluşturduğunda oluşuyo daha sonra değiştiremiyorsun referanssa içindeki değeri değiştirebiliyosun
//feature yapı bir işlem başlatınca başka işşlemleri de aynıda anda yapabiliyosunuz Başlat işin bitince şunu yap gibi feature gelecek
//streamda asenkron çalışıyo aynı gibi ama farkı işi bir kez daha daha aynı yapabiliyo bi video indir gibi aynı formatta giden çok sürekli gibi 
  Stream get getStream => cartStreamController.stream; // streaksontroller için getir yaptık 

  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartStreamController.sink.add(CartService.getCart());//sink ile get cartı kullanan kim varsa onuni için gerekli buildi çalıştır ilgili yerler güncellenecek Sink önemli unutma!!!
  }

  void removeFromCart(Cart item) {

    CartService.removeCart(item);
    cartStreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart(){
    return CartService.getCart();
  }
}  

final cartBloc = CartBloc();