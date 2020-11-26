import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/bottom_list_privode.dart';
import '../model/bottom_list_model.dart';

class BottomListPage extends StatefulWidget {
  @override
  _BottomListPageState createState() => _BottomListPageState();
}

class _BottomListPageState extends State<BottomListPage> {
  @override
  void didChangeDependencies() {
    _initData();
    super.didChangeDependencies();
  }

  int _currentIndex = 0;

  void _initData() {
    List data = [
      {'title': 'Profit', 'imgUrl': '','type': true},
      {'title': 'Value', 'imgUrl': '','type': false},
      {'title': 'A - Z', 'imgUrl': '','type': true},
    ];
    BottomListModel model = BottomListModel.fromJosn(data);
    Provide.value<BottomListPrivode>(context).xgetListData(model.listData);
  }

  
  @override
  Widget build(BuildContext context) {
    return Provide<BottomListPrivode>(builder: (context, child, listProvide) {
      return Scaffold(
        appBar: AppBar(title:Text('BottomListPage')),
        body: Center(
          child: RaisedButton(
          onPressed: () {
            showBottomChooseList(context, listProvide.data);
            // showBottomChooseList(context);
          },
          child: Text(listProvide.data[_currentIndex].title),
        ),
        )
      );
    });
  }

  void showBottomChooseList(BuildContext context,List<BottomListItemData> data) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
              mainAxisSize: MainAxisSize.min, children: listCell(data));
        });
  }

  List<Widget> listCell(List<BottomListItemData> sortType) {
    List<ListTile> listTiles = [];

    for (int i = 0;i < sortType.length; i++) {
      BottomListItemData item = sortType[i];
      ListTile listTile = ListTile(
        title: Text(item.title),
        trailing: Image.asset(
            item.type ? 'images/arrow_up.jpg' : 'images/arrow_down.jpg'),
        onTap: () async {
          _currentIndex = i;
          item.type = !item.type;
          Provide.value<BottomListPrivode>(context).refreshData(item, i);
          // Navigator.pop(context);
        },
      );
      listTiles.add(listTile);
    }

    // for (var item in sortType) {
    //   ListTile listTile = ListTile(
    //     title: Text(item['title']),
    //     trailing: Image.asset(
    //         item['type'] ? 'images/arrow_up.jpg' : 'images/arrow_down.jpg'),
    //     onTap: () async {
    //       setState(() {
    //         item['type'] = !item['type'];
    //         _currentIndex = sortType.indexOf(item);
    //         print('index =========== $_currentIndex');
    //       });
    //       // Navigator.pop(context);
    //     },
    //   );
    //   listTiles.add(listTile);
    // }
    return listTiles;
  }
}
