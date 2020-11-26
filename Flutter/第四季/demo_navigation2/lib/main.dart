
import 'package:flutter/material.dart';
import 'Product.dart';
import 'ProductDetails.dart';

void main() {

  runApp(MaterialApp(
    title: "11111",
    home: ProductList(
      products:List.generate(
        20,
        (i)=>Product('商品 $i','描述 $i')
    ),
  ))
  );

}

class ProductList extends StatelessWidget {

  final List<Product> products;
  ProductList({Key key,@required this.products}):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('商品')),
      body: ListView.builder(
        itemCount:products.length,
        itemBuilder: (context,index){
          return ListTile(
            title:Text(products[index].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(product: products[index])));
            },
          );
        },
      ),
    );
  }
}





