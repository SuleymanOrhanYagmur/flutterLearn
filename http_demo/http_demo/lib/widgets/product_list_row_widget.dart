import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  final List<Product> products;

  ProductListRowWidget(this.products);

  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10.0),
        SizedBox(
          height: 500.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(products.length, (index) {
              return ProductListRowWidget(products[index] as List<Product>);
            }),
          ),
        ),
      ],
    );
  }
}
