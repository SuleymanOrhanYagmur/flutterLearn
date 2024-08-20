import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_demo/screens/product_list.dart';

void main() {
  // sqflite_common_ffi'yi kullanıyorsanız, bu satırı ekleyin
  sqfliteFfiInit();

  // `databaseFactory` global değişkenini ayarlayın
  databaseFactory = databaseFactoryFfi;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Ticaret Uygulaması',  // Uygulamanızın adını ekleyebilirsiniz
      home: ProductList(),
    );
  }
}
