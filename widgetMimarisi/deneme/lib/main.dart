

import 'package:deneme/models/student.dart';
import 'package:deneme/screens/student_add.dart';
import 'package:flutter/material.dart';
// ListWiew konusunda alıştırma, Buton konusunda alıştırma, Listeyi ekrana kısım kısım bastırma yönünde çalışma var
void main(){
  runApp(MaterialApp( // Uygulamanın kök widget'ını tanımlar ve farklı cihazlarla uyum sağlar
    home: MyApp()// MyApp widget'ını ana ekran olarak belirler Constructor bulunuyor bu home parametresi vasıtasıyla 

  )); 

}
  //(STATELESSWİDGETLERDE) ekrana hızlı çizilen ama durum ihtiyacı olmayan widgetlerdir Bir değeri değiştirdiğinda değişen şeyler yansımamış oluyor
 // MyApp sınıfı StatelessWidget'tan türemiş, yani durum bilgisi olmayan bir widget
class MyApp extends StatefulWidget{ 

  @override
  State<MyApp> createState() => _MyAppState();//MyAppState döndüren fonksiyon yaratıyorsunuz 
}

class _MyAppState extends State<MyApp> { 
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0,"","",0);

  List<Student> student1 = [Student.withId(1,"Polat", "Alemdar",25), Student.withId(2,"Memati","Baş",65),Student.withId(3,"İskender","Büyük",45)];

  //var ogrenciler = ["Suleyman Orhan", "Maraz Ali", "Fatih Sultan Mehmet","Süleyman Çakır"];

  @override
  Widget build(BuildContext context) {


    return Scaffold(// 
      appBar: AppBar( //app bar isimli widget kullanılmış 
        title: Text( mesaj), //text bile widget
      ),
      body: buildBody(context), 

    ); 
    
  }
  /* Kod amacı sınav hesaplamaydı ama şu anlık işimiz yok
  String sinavHesapla(int puan){

  
              String mesaj = "";
              if(puan >= 50) {
                mesaj = "Gecti ";
              }
              else if(puan <50) {
                mesaj = "Kaldı";
              }

  return mesaj;              
  }*/

  void mesajGoster(BuildContext context,mesaj) {

    print('Butona tıklandı!'); // tıklandığı bilgisi buraya geldi debug kısmına geldi

              
    var alert = AlertDialog(// Bu alert ekrana bi bildiri yayınlıyor
      title: Text("İşlem sonucu"),// başlık
      content: Text(mesaj),//içerik demek
    );
          
    showDialog(context: context, builder: (BuildContext context) =>alert); // kendi widgetini oluşturduğunda buildcontext deki context buraya düştü 

  }

  Widget buildBody( BuildContext context) { // Bizim normalde scaffoldun body kısmındaydı kodumuz ama inheritance class yapıları kullanarak kısımlara bölüyoruz
        return  Column(
        children: <Widget> [
          Expanded( // size hataları olmaz bunun sayesinde Araya bağdaştırıcak widget bu 
            child: ListView.builder(
              itemCount: student1.length,
              itemBuilder: (BuildContext context,int index){ //eleman sayısı kadar içeriyi çalıştırmaya yarıyor
              return ListTile( // Her bir elemanın nereye yerleştirieceğini söyleyen kısımdır
              leading: CircleAvatar( // en başa ekleme yapıyor
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/09/07/11/37/sunset-1651426_1440_2560.jpg"),),
              title: Text(student1[index].firstName+ " "+ student1[index].lastName), // Başlık
              subtitle: Text("Sınavdan aldığı not: " + student1[index].grade.toString() + " [ " + student1[index].getStatus + " ]"),
              trailing: buildStatusIcon(student1[index].grade), // Bu satırın en sonuna ekleme yapıyor
              onTap: (){
                setState(() {// BU ŞU İŞE YARIYOR BUİLD İŞLEMİNİ ÇALIŞTIR SECİLİ OĞRENCİYİ KİM KULLANIYORSA YENİDEN ÇİZ DEMEK
                selectedStudent =student1[index];
                
                  
                });
                print(selectedStudent.firstName);// ekranda tıkladığı anda debugconsole bildirim düşüyor
              },
              )   ;       //Text(student1[index].firstName); O NESNENİN HANGİ ALANINI İSTİYORSAK


              })
            
            
            /*ListView( LİSTVİEW KULLANIM ŞEKLİ
              children: [
                Text("Suleyman orhan",),
                Text("Kemal Sunal",),
                Text("Fatih Sultan Mehmet"),
              ],
            ),*/
          ), // Lİstview expanded ile tüm boşluklrı kapattığı için aşağıdaki text aşağıda oldu


          Text("Seçili Öğrenci: "+ selectedStudent.firstName),
          Row(// yan yana koymayı öğretiyor
            children: <Widget>[ // istediğin kadar yan yana koyabiliyorsun
            Flexible( // satırın tamamına kendisini yapıştırır satır dediğimiz için
              fit: FlexFit.tight,
              flex: 2, // ne kadarlık pay verdiğini ifade eder
            child: ElevatedButton(
          
              onPressed: () async {
              // Buton tıklama olayını burada ele alın
              final result = await  Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>StudentAdd(student1))
                ); // gitmesini istediğin yeri seçiyorsun bu şekilde gönderiyosun 
                if(result != null && result is Student) {
                  setState(() {
                    student1.add(result);
                  });
                }  
            
              },//builder de ilgili contextle ilgili neyin çalışması gerektiğini gösterir
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: Row(
                children: [
                  Icon(Icons.add),  
                  SizedBox(width: 10,),
                  Text('Öğrenci'),
                ],
              ), // buton burda
            )
          
            
            ),

            Flexible( // satırın tamamına kendisini yapıştırır satır dediğimiz için
              fit: FlexFit.tight,
              flex: 1,
            child: ElevatedButton(
          
              onPressed: () {
              // Buton tıklama olayını burada ele alın
                  
                  String mesaj = "Güncellendi";
                mesajGoster(context,mesaj);
              },//builder de ilgili contextle ilgili neyin çalışması gerektiğini gösterir
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Row(
                children: [
                  Icon(Icons.update),
                  SizedBox(width: 100.0,), // iconla text arasına boşluk eklemeni sağladı
                  Text('Güncelle'), // bunu seçip ampulden row tıklayınca oluştu
                ],
              ), // buton burda
            )
          
            
            ),

            Flexible( // satırın tamamına kendisini yapıştırır satır dediğimiz için
              fit: FlexFit.tight,
              flex: 1,
            child: ElevatedButton(
            
                  
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: Row( // bulunan satırıda ilgili bölümde childenin içinde icon arasında boşluk için sizedbox ve text eklendi
                children:<Widget> [
                  Icon(Icons.delete),
                  SizedBox(width: 100.0,),
                  Text('Sil'),
                ],
              ), // buton burda

                onPressed: () {
                  // Buton tıklama olayını burada ele alın
                  setState(() {

                    student1.remove(selectedStudent);       //removeLast() Bu sonuncuyu siler removeAt indexi siler numara olarak remove objeyi siler 
                  });
                  
                      String mesaj = "Silindi " + selectedStudent.firstName;
                    mesajGoster(context,mesaj);
                  },//builder de ilgili contextle ilgili neyin çalışması gerektiğini gösterir


            )
          
            
            )


            ],

          )
          
        ],
      );
  }

  Widget buildStatusIcon(int grade) {
  
              if(grade > 50) {
               return Icon(Icons.done);
              }
              else if(grade >=40) {
                return Icon(Icons.album);

            }
            else {
              return Icon(Icons.clear);
            }
    


  }
}