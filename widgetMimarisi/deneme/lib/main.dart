

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
  String mesaj = "Bu benim uygulamam";

  Student student1 = Student("Engin", "Demir",25);
  
  
  var ogrenciler = ["Suleyman Orhan", "Kemal Sunal", "Fatih Sultan Mehmet","Süleyman Çakır"];

  @override
  Widget build(BuildContext context) {


    return Scaffold(// 
      appBar: AppBar( //app bar isimli widget kullanılmış 
        title: Text("Merhava ilk uygulamam" + mesaj), //text bile widget
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
              itemCount: ogrenciler.length,
              itemBuilder: (BuildContext context,int index){ //eleman sayısı kadar içeriyi çalıştırmaya yarıyor
              return Text(ogrenciler[index]);


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
}