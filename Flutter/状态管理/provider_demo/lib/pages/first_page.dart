import 'package:flutter/material.dart';
// import 'package:flutter_provide/SecondPage.dart';
import 'package:provider/provider.dart';
import '../providers/count.dart';
 
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("第一个页面"),
        actions: <Widget>[
          // FlatButton(
          //   child: Text("下一页"),
          //   onPressed: () => {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return SecondPage();
          //     })),
          //   },
          // )
        ],
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<Counter>(context,listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

