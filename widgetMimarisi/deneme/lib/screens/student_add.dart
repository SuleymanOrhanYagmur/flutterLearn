import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget{
  @override // statefullwidgetin içindeki createstate kullanıyoruz Zorunlu override edileiblir bi yapı olarak
  State<StatefulWidget> createState() { //eziyor ne yapmak istiyorsa onu yapıyor
    
    return _StudentAddState();  //_ o classa özel bir sınıf olduğunu anlatmak için kullanılır
  }


}

class _StudentAddState extends State<StudentAdd>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }



}

// eğer onun içinde state'i konu olan bi datayı değiştirdiğinizde verilerinin değişmesini istiyorsanız statefull yapcan
//emin değilsen stateless yaparsın farklı olduğunu anladığında bundan statefull a çevirebilirsin (ampulden git statfull a çevir dersin)