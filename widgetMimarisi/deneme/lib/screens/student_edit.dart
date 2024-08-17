import 'package:deneme/models/student.dart';
import 'package:deneme/validation/student_validator.dart';
import 'package:flutter/material.dart';

class StudentEdit extends StatefulWidget{
  final Student selectedStudent;

  StudentEdit(this.selectedStudent); // Varsayılan boş bir liste sağlıyoruz
  @override // statefullwidgetin içindeki createstate kullanıyoruz Zorunlu override edileiblir bi yapı olarak
  State<StatefulWidget> createState() { //eziyor ne yapmak istiyorsa onu yapıyor
    
    return _StudentEditState(selectedStudent);  //_ o classa özel bir sınıf olduğunu anlatmak için kullanılır
  }// student1'i studentaddstate geçiriyoruz


}

class _StudentEditState extends State<StudentEdit> with StudentValidatorMixin{ //studentvalidateorMixin fıonksiyonları kullanıkabiliyor Mixin With ile kullanılır 
  final Student selectedStudent;
  final  formKey = GlobalKey<FormState>();

  _StudentEditState(this.selectedStudent ); // Varsayılan boş bir liste sağlıyoruz
  @override//
  Widget build(BuildContext context) { // widget ağacını çizdiğimiz yer burası
    return Scaffold(

      appBar: AppBar(

        title: Text("Öğrenci Güncelle "),
      

      ),  
      body: Container( // sağdan ve soldan boşluklar koymaya yarıyor SAĞ SOLA KENDİSİNİ YAPIŞTIRIYOR
          margin: EdgeInsets.all(20.0), //all dediğin zaman sağdan soldan her yerden boşluk bırakıyosun container için geçerli only de parantez içine eklediklerini yapıyor
      child: Form(
        key: formKey, // OTOMATİK ALAN oluşturmuş oluyor
        child: Column(
          children: <Widget>[
            buildFirstNameField(),
            buildLastNameField(),
            buildGradeField(),
            buildSubmitButton(),

          ],
        ),
        ),
      )
    );
  }
  
  Widget buildFirstNameField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim
     initialValue: selectedStudent.firstName,
              decoration: InputDecoration(
                labelText: "Öğrenci Adı:",
                hintText: "Süleyman",
              ),
                validator: validateFirstName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  selectedStudent.firstName = value ?? ''; // Null değerini handle eder
                },
            );
  }
  
  Widget buildLastNameField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim
    initialValue: selectedStudent.lastName, // Bunun sayesinde baştaki değer ekranda gözükür 

              decoration: InputDecoration(
                labelText: "Öğrenci SoyAdı:",
                hintText: "Soyad",
              ),
                validator: validateLastName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  selectedStudent.lastName = value ?? ''; // Null değerini handle eder
                },
            );
  }
  
  Widget buildGradeField() {
    return TextFormField( // yeni bir class yapmış oluyoruz o yüzden return dedim
    initialValue: selectedStudent.grade.toString(),
              decoration: InputDecoration(
                labelText: "Öğrenci Notu:",
                hintText: "100",
              ),
                validator: validateGradeName, // İlgili alana girilecek formatın uygunluğunu kontrol eder
                onSaved: (String? value) { // value nullable olmalı
                  selectedStudent.grade = int.parse(value ?? '0'); // Null değerini handle eder
                },
            );
  }
  
  Widget buildSubmitButton() {
    return Flexible(
      child: ElevatedButton(
        
        child: Text("Kaydet"),
        onPressed: (){ // beenim formlara erişmem lazım
        if(formKey.currentState!.validate()) {
          formKey.currentState?.save();// save çalıştırdığında bellekteki referansı değiştiği için bellekteki referans değişmiş olucak
           // bellekteki aynı adrese yapıştırmış oluyoruz 
          saveStudent(); // Kaydetme işlemi burada yapılır BUNU GBT ÇIKARTMIŞ
          Navigator.pop(context, "Öğrenci güncellendi: ${selectedStudent.firstName} ${selectedStudent.lastName}"); // Ana sayfaya geri dönerken yeni eklenen öğrenciyi gönderiyoruz
          //en son eklediği en üste eklliyor pop en üste eklenir  
        }

        },
        
        ),

    );

  }
  
  void saveStudent() {

    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
    
  }



}

// eğer onun içinde state'i konu olan bi datayı değiştirdiğinizde verilerinin değişmesini istiyorsanız statefull yapcan
//emin değilsen stateless yaparsın farklı olduğunu anladığında bundan statefull a çevirebilirsin (ampulden git statfull a çevir dersin)