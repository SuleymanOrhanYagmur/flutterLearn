import 'package:flutter/material.dart';

// Sized Boxx içinde iskelet kutu oluşturur içinde width ve height olur
class ContainerSizedBoxLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), //b iskeleti olması açısından
      body: Column(
        children: [
          SizedBox(
            width:
                300, // 300 pixel olarak generic bi alan DEĞİL bütün ekranlarda 200 pixel alan kaplıycak şekilde
            height: 200,
            child: Text('a' * 500),
          ),
          SizedBox.shrink(), // Boş bir yer olması için shiring kullanılıyor
          SizedBox.square(
            dimension: 50,
            child: Text('b' * 50),
          ),

          Container(
            height: 50,
            constraints: const BoxConstraints(
                maxWidth: 150,
                minWidth: 100,
                maxHeight: 100), // o kadar gidebilsin
            child: Text('mm' * 1),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient:
                    const LinearGradient(colors: [Colors.red, Colors.black]),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.green,
                      offset: Offset(0.1, 1),
                      blurRadius: 12)
                ],
                border: Border.all(width: 10, color: Colors.white12)),
          )
        ],
      ),
    );
  }
}
