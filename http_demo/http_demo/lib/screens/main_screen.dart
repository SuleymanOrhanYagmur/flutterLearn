import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http_demo/data/data.api/category_api.dart';
import 'package:http_demo/models/category.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Category> categories = List<Category>();
  List<Widget> categoryWidgets= List<Widget>();
  @override
  void initState() {
    getCategoriesFromApi();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Alışveriş Sistemi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              // yatay horizontal yada dikey
              scrollDirection: Axis.horizontal, //BU WİDGET GÜZEL WİDGET SAĞ SOLA TAŞINCA KAYDIRABİLİYORSUN 
              child: Row(children: categoryWidgets,),
            )
          ],
        ),
      ),
    );
  }
  
  void getCategoriesFromApi() {
    CategoryApi.getCategories().then()
  }
}
