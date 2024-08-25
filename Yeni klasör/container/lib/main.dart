import 'package:flutter/material.dart';

void main() {
  runApp(
    BenimUyg(),
  );
}

class BenimUyg extends StatelessWidget {
  // Başkasıya etkileşime girmeyen öyle kalan
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          // SCAFFOLDUN GÖVDESİNDE BULUNAN CONTAİNERİMIZI güveenli areaya çektk

          child: Row(
            // row yan yana çizer ,Column dikey dikey çizer alt alta
            //mainAxisAlignment: MainAxisAlignment.center, -- spaceEvenly boşluk bıraktırıyo, start dersen baştan sıralıyor aşağıya doğru, end en alttan başlıyor sıralamaya
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              // center ortadan
              Container(
                color: Colors.white,
                width: 200,
                height: 100,
                child: Text('1. Container'),
              ),
              SizedBox(
                height: 30, // yükeseklikte alan kaplar
                width: 50, // yatayda alan kaplar
              ),
              Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: Text('2. Continer'),
              ),
              Container(
                color: Colors.orange,
                height: 100,
                width: 200,
                child: Text("3. Container"),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ],
          ),

          /* BU ALT KISIM Bİ YÖNTEMLERDEN BİRİSİ
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.circular(16.0),
                color: Colors.green),
            margin: EdgeInsets.fromLTRB(25, 12, 35,
                100),     // komşu elemanlarla arasında boşluk bırakmak için kullanıyor
            padding: EdgeInsets.all(
                26.0), //b her ynde eşit 16 pixel boşluk bıraktı Elemanın sınırlarından kendi içerisinde boşluk bırakıyor
            //color: Colors.white,
            child: Text('Kod planet'),
          */
        ),
      ),
    );
  }
}
