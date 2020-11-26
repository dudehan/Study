import 'package:flutter/material.dart';


class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {

  // MyModel _model;

  Future<MyModel> _getModel() async {

      return await Future.delayed(Duration(seconds:3),(){
        print('加载数据');
        return MyModel.fromJson({'title':'这是获取到的网络数据'});

      });

  }

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('FutureBuilderDemo'),),
      body: FutureBuilder(
        future: _getModel(),
        builder: (BuildContext context, AsyncSnapshot<MyModel> snapshot){

          switch(snapshot.connectionState) {
            case ConnectionState.none:
                  return new Text('Input a URL to start');
            case ConnectionState.waiting:
                  return new Center(child: new CircularProgressIndicator());
            case ConnectionState.active:
                  return new Text('');
            case ConnectionState.done:
                  return Text('${snapshot.data.title}');
            default :
              return Text('default');
          }
        },
      ),
    );
  }




}

class $ {
}

class MyModel {

  String title;
  MyModel({this.title});

  factory MyModel.fromJson(Map<String, dynamic> json) {
    return MyModel(title: json['title']);
  }

}