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

  var customerManager = CustomerManager();
  
  Person customer1 = Customer.withInfo("Salih", "Demiroğ");



  var customer2 = Customer();
  customer2.firstName = "Süleyman";
  customer2.lastName = "Orhan";
  
  customerManager.add(customer1);
  customerManager.add(customer2);



}

class PersonelManager {
  void add() {
    print("Personel eklendi!");
  }

  void update() {
    print("Personel güncellendi!");
  }

  void delete() {
    print("Personel silindi!");
  }
}

class CustomerManager {
  void add(Customer customer) {
    print("Müşteri eklendi: "+ customer.firstName);
  }
}

class Customer extends Person{


  Customer();

  Customer.withInfo(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }


}


class Personel extends Person{ // Person'un içindeki özellikler aynı zamanda Personelde de vardır diyip tekrar firstName,lastName ihtiyacımız yok INHERİTANCE
 
  int? dateOfStart;

  Personel();

  Personel.withInfo(String firstName, String lastName, int dateOfStart) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.dateOfStart = dateOfStart;

  }
  

}

class Person {
  String? firstName;
  String? lastName;

}
