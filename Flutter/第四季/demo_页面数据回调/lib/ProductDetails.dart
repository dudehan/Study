
import 'package:dem0_part3/Product.dart';
import 'package:flutter/material.dart';
import 'Product.dart';

class ProductDetails extends StatelessWidget {

  final Product product;

  const ProductDetails({Key key,@required this.product}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("商品详情")),
      body: Text(product.description),
    );
  }
}