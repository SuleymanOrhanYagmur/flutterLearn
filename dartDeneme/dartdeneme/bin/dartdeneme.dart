import 'package:dartdeneme/dartdeneme.dart' as dartdeneme;
/*
class Kisi {
  String isim;
  String soyisim;

  // Kurucu fonksiyon
  Kisi(this.isim, this.soyisim);

  void bilgileriYazdir() {
    print('İsim: $isim, Soyisim: $soyisim');
  }
}

void main() {
  // Bir Kisi nesnesi oluşturuyoruz
  Kisi kisi1 = Kisi('Ali', 'Veli');

  // Bilgileri yazdırıyoruz
  kisi1.bilgileriYazdir();
}
*/


void main() {
  var personelManager = PersonelManager();
  personelManager.add();
  var customerManager = Customer();
  var customer1 = new Customer.withInfo("Salih","Demiroğ");

  var customer2 = new Customer();
  customer2.firstName = "Suleyman";
  customer2.lastName = "Orhan";
  customerManager.add(customer1);


}



class PersonelManager {

  void add() {
    print("Eklendi!");
  }

  void update() {


    print("Güncellendi!");
  }

  void delete(){
    print("Silindi");
  }

}

class Customer{

  String firstName;
  String lastName;

  Customer(){

  }
  Customer.withInfo(String firstName,String lastName)
  {
    this.firstName = firstName;
    this.lastName  = lastName;
  }

}