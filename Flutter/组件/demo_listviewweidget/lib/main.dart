
import 'package:flutter/material.dart';

void main() => runApp(MyApp(

  items:new List<String>.generate(1000, (i)=>"Item $i")

));

class MyApp extends StatelessWidget {

  final List<String> items;
  //接受数据
  MyApp({Key key,@required this.items}):super(key:key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'list view widget',
      home:Scaffold(
        appBar:new AppBar(
          title: new Text('xxxxx'),
        ),
        
        // body: MyList(),//自定义组件
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return new ListTile(
              title:new Text('${items[index]}')
            );
          }
        ),
      )
    );
  }
}


class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,//横向列表,默认上下列表
          children: <Widget>[
            // new ListTile(
            //   leading:new Icon(Icons.android),
            //   title: new Text('biaoti'),
            // ),
            
            // new Image.network('https://img1.mukewang.com/szimg/5e6f2f240847796506000338-360-202.jpg'),
            // new Image.network('https://img1.mukewang.com/szimg/5ea0118b0948c90a12000676-360-202.png'),
            // new Image.network('https://img1.mukewang.com/szimg/5e54bebe087fe86d06000338-360-202.jpg'),
          ]
    );
  }
}
