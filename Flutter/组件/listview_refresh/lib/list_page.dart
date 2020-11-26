import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // ListView数据集合
  List<String> _list = List.generate(20, (i) => '原始数据${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表的下拉刷新和上拉加载'),
      ),
      body: Container(
        child: RefreshIndicator(
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
                  title: Text(_list[index]),
                ),
            itemCount: _list.length,
          ),
          onRefresh: _handleRefresh,
        ),
      ),
    );
  }

  // 下拉刷新方法
  Future<Null> _handleRefresh() async {
    // 模拟数据的延迟加载
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // 在列表开头添加几条数据
        List<String> _refreshData = List.generate(5, (i) => '下拉刷新数据${i + 1}');
        _list.insertAll(0, _refreshData);
      });
    });
  }
}
