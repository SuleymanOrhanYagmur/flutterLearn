

import 'package:deneme/models/student.dart';
import 'package:flutter/material.dart';
// ListWiew konusunda alıştırma, Buton konusunda alıştırma, Listeyi ekrana kısım kısım bastırma yönünde çalışma var
void main(){
  runApp(MaterialApp( // Uygulamanın kök widget'ını tanımlar ve farklı cihazlarla uyum sağlar
    home: MyApp()// MyApp widget'ını ana ekran olarak belirler Constructor bulunuyor bu home parametresi vasıtasıyla 

  )); 

}

class MyApp extends StatelessWidget{
 // MyApp sınıfı StatelessWidget'tan türemiş, yani durum bilgisi olmayan bir widget
  String mesaj = "Öğrenci Takip Sistemi";

  List<Student> student1 = [Student("Engin", "Demir",25), Student("Kerem","Varis",65),Student("Halil","Duymaz",45)];
  
  
  var ogrenciler = ["Suleyman Orhan", "Kemal Sunal", "Fatih Sultan Mehmet","Süleyman Çakır"];

  @override
  Widget build(BuildContext context) {


    return Scaffold(// 
      appBar: AppBar( //app bar isimli widget kullanılmış 
        title: Text( mesaj), //text bile widget
      ),
      body: buildBody(context), 

    ); 
    
  }
  String sinavHesapla(int puan){

  
              String mesaj = "";
              if(puan >= 50) {
                mesaj = "Gecti ";
              }
              else if(puan <50) {
                mesaj = "Kaldı";
              }

  return mesaj;              
  }


  void mesajGoster(BuildContext context,mesaj) {

    print('Butona tıklandı!'); // tıklandığı bilgisi buraya geldi debug kısmına geldi

              
    var alert = AlertDialog(// Bu alert ekrana bi bildiri yayınlıyor
      title: Text("Sınav sonucu"),// başlık
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
                print(student1[index].firstName+ " "+ student1[index].lastName);// ekranda tıkladığı anda debugconsole bildirim düşüyor
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
          ),
          Center(
            child: ElevatedButton(
          
              onPressed: () {
              // Buton tıklama olayını burada ele alın
                  
                  String mesaj = sinavHesapla(55);
                mesajGoster(context,mesaj);
              },//builder de ilgili contextle ilgili neyin çalışması gerektiğini gösterir
              child: Text('Butona Tıkla'), // buton burda
            )
          
            ),
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