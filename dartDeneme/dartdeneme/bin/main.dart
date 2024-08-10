import 'package:dartdeneme/dartdeneme.dart' as dartdeneme;


void main() {
  var personelManager = PersonelManager();
  personelManager.add();

  var customerManager = CustomerManager();
  
  Customer customer1 = new Customer.withInfo("Salih", "Demiroğ");



  var customer2 = new Customer();
  customer2.firstName = "Süleyman";
  customer2.lastName = "Orhan";
  
  customer1 = customer2;
  customer2.firstName = "Mehmet";



  customerManager.add(customer1);
  // Steak ve Heap bulunu

  var controller = PersonController(); 

  controller.operation(customer1); // sen burda customer gönderdin öbür tarafta Person olarak karşıladı ama sorun değil 
  //Mehmet yazıcak çünkü customer içinde Person var extend ettiğimiz için

  Personel personel1 = Personel();
  personel1.firstName = "Fatma";

  var controller2 = PersonController();  // burda PersonelController türünde oluşturuldu içerik türüne Personel gönderdik tür olarak yine gönderdiğimiz classta
  //person türündeydi ama personu extend ettiğimiz için üsteeki örnektekş gibi çalıştı
  

  controller.operation(personel1); 


}

class PersonController {
  void operation(Person person) {// sen burda parametre olarak person göndermiyorsun PARAMETRE OLARAK BELLEKTEKİ ADRESİ REFERANSI gönderiyorsun 
    print("Inheritance demo: ${person.firstName}"); // sonuna + koyarak yazınca hata verdi böyle kullanıma izin veriyor
    
  } 

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
    print("Müşteri eklendi: ${customer.firstName}");
  }

  void update() {
    print("Güncellendi");

  }
  void delete() {
    print("Silindi");

  }
}

class Customer extends Person{


  Customer(){

  }

  Customer.withInfo(String firstName, String lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
  }


}


class Personel extends Person{ // Person'un içindeki özellikler aynı zamanda Personelde de vardır diyip tekrar firstName,lastName ihtiyacımız yok INHERİTANCE
 
  int? dateOfStart;

  Personel(){

  }

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
