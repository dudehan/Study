import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../model/home_model.dart';
import '../provide/home_provide.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    _initData();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  void _initData() {
    List data = [];
    data
      ..add({'title': 'AAAA', 'subTitle': 'aaaa', 'count': 0})
      ..add({'title': 'BBBB', 'subTitle': 'bbbb', 'count': 1})
      ..add({'title': 'CCCC', 'subTitle': 'cccc', 'count': 2});

    HomeDataModel model = HomeDataModel.fromJson(data);
    Provide.value<HomePageDataProvide>(context).xgetListData(model.data);
    print(model.data[0].title);
  }

  @override
  Widget build(BuildContext context) {
    return Provide<HomePageDataProvide>(builder: (context, child, dataProvide) {
      return Scaffold(
        
        appBar: AppBar(title:Text('HomePage')),
        body: ListView.builder(
          
        itemCount: dataProvide.listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
            child: _myCard(dataProvide.listData[index],index),
          );
        },
      ));
    });
  }

  Widget _myCard(ListData data, int index) {
    return Card(
        child: Column(children: [
      Text(data.title),
      Text(data.count.toString()),
      RaisedButton(onPressed: () {
        print('xxxxx');
        data.count += 1;
        // Provide.value<HomePageDataProvide>(context)
        //     .addListDate([data]);
        Provide.value<HomePageDataProvide>(context)
            .refreshListData(data,index);
        
      })
    ]));
  }
}
