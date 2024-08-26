import 'package:flutter/material.dart';
import 'package:flutter_application_1/101/container_sized_box_learn.dart';
import 'package:flutter_application_1/101/scaffold_learn.dart';
import 'package:flutter_application_1/101/text_learn_view.dart';

void main() {
  runApp(const MyApp()); // bu projeyi başlatıyo  ama ana şema aşağıda çiziliyor
  print("hello");
  var list = [1, 23, 4];

  list.add(156);
  print(list);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // HAYATIN ÇÇİZİLDİĞİ NOKTA flutter projelerinin temasının adı Proje ana hatları burada belirleniyo
      // returun CupertinoApp ios componentlerine yönelik yaklaşım
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 19, 3, 252)),
        useMaterial3: true,
      ),
      home: ScaffoldLearn(),
    );
  }
}
