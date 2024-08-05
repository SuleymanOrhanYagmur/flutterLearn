

import 'package:flutter/material.dart';
// ListWiew konusunda alıştırma, Buton konusunda alıştırma, Listeyi ekrana kısım kısım bastırma yönünde çalışma var
void main(){
  runApp(MaterialApp( // farklı cihazlarda uyum getiriri
    home: MyApp()

  )); 

}

class MyApp extends StatelessWidget{

  String mesaj = "Bu benim uygulamam";
  @override
  Widget build(BuildContext context) {

    var ogrenciler = ["Suleyman Orhan", "Kemal Sunal", "Fatih Sultan Mehmet","Süleyman Çakır"];
    return Scaffold(// 
      appBar: AppBar( //app bar isimli widget kullanılmış 
        title: Text("Merhava ilk uygulamam" + mesaj), //text bile widget
      ),
      body: Column(
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
              print('Butona tıklandı!'); // tıklandığı bilgisi buraya geldi debug kısmına geldi
              int puan =150;
              String cumle = "";
              if(puan >= 50) {
                cumle = "Gecti ";
              }
              else if(puan <50) {
                cumle = "Kaldı";
              }
          
              var alert = AlertDialog(// Bu alert ekrana bi bildiri yayınlıyor
                title: Text("Sınav sonucu"),// başlık
                content: Text(cumle),//içerik demek
              );
          
              showDialog(context: context, builder: (BuildContext context) =>alert); // kendi widgetini oluşturduğunda buildcontext deki context buraya düştü 
              },//builder de ilgili contextle ilgili neyin çalışması gerektiğini gösterir
              child: Text('Butona Tıkla'), // buton burda
            )
          
            ),
        ],
      ),
    ); 
    
  }


}