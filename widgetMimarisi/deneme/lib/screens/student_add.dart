import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget{
  final List<Student> student1;

  StudentAdd(this.student1); // Varsayılan boş bir liste sağlıyoruz
  @override // statefullwidgetin içindeki createstate kullanıyoruz Zorunlu override edileiblir bi yapı olarak
  State<StatefulWidget> createState() { //eziyor ne yapmak istiyorsa onu yapıyor
    
    return _StudentAddState(student1);  //_ o classa özel bir sınıf olduğunu anlatmak için kullanılır
  }// student1'i studentaddstate geçiriyoruz


}

class _StudentAddState extends State<StudentAdd> with StudentValidatorMixin{ //studentvalidateorMixin fıonksiyonları kullanıkabiliyor Mixin With ile kullanılır 
  List<Student> student1;

  var student = Student.withoutInfo(); 
  var formKey = GlobalKey<FormState>();

  _StudentAddState(this.student1 ); // Varsayılan boş bir liste sağlıyoruz
  @override//
  Widget build(BuildContext context) { // widget ağacını çizdiğimiz yer burası
    return Scaffold(

      appBar: AppBar(

        title: Text("Yeni öğrenci Ekle "),
      

      ),  
      body: Container( // sağdan ve soldan boşluklar koymaya yarıyor SAĞ SOLA KENDİSİNİ YAPIŞTIRIYOR
          margin: EdgeInsets.all(20.0), //all dediğin zaman sağdan soldan her yerden boşluk bırakıyosun container için geçerli only de parantez içine eklediklerini yapıyor
      child: Form(
        key: formKey, // OTOMATİK ALAN oluşturmuş oluyor
        child: Column(
          children: <Widget>[
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeNameField(),
            buildSubmitButton(),

          ],
        ),
        ),
      )
    );
  }
  
  Widget buildFirstNameField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim

              decoration: InputDecoration(
                labelText: "Öğrenci Adı:",
                hintText: "Süleyman",
              ),
                validator: validateFirstName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  student.firstName = value ?? ''; // Null değerini handle eder
                },
            );
  }
  
  Widget buildLastNameField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim

              decoration: InputDecoration(
                labelText: "Öğrenci SoyAdı:",
                hintText: "Soyad",
              ),
                validator: validateLastName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  student.lastName = value ?? ''; // Null değerini handle eder
                },
            );
  }
  
  Widget buildGradeNameField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim

              decoration: InputDecoration(
                labelText: "Öğrenci Notu:",
                hintText: "100",
              ),
                validator: validateGradeName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  student.grade = int.parse(value ?? '0'); // Null değerini handle eder
                },
            );
  }
  
  Widget buildSubmitButton() {
    return Flexible(
      child: ElevatedButton(
        
        child: Text("Kaydet"),
        onPressed: (){ // beenim formlara erişmem lazım
        if(formKey.currentState!.validate()) {
          formKey.currentState?.save();
           // bellekteki aynı adrese yapıştırmış oluyoruz 
          
          Navigator.pop(context, student); // Ana sayfaya geri dönerken yeni eklenen öğrenciyi gönderiyoruz
          //en son eklediği en üste eklliyor pop en üste eklenir  
        }

        },
        
        ),

    );

  }
  
  void saveStudent() {

    print(student.firstName);
    print(student.lastName);
    print(student.grade);
    setState(() {
      
      student1.add(student);
    });
  }



}

// eğer onun içinde state'i konu olan bi datayı değiştirdiğinizde verilerinin değişmesini istiyorsanız statefull yapcan
//emin değilsen stateless yaparsın farklı olduğunu anladığında bundan statefull a çevirebilirsin (ampulden git statfull a çevir dersin)