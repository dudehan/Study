import 'package:flutter/material.dart';
import 'model.dart';

class LCListView extends StatefulWidget {
  @override
  _LCListViewState createState() => _LCListViewState();
}

class _LCListViewState extends State<LCListView> {
  List<CellModel> models = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      models.add(CellModel(title: 'title_$i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    print('ListView build ...');
    return Container(
      child: ListView.builder(
          itemCount: models.length,
          itemBuilder: (ctx, index) {
            return CellItem(model: models[index]);
            // return _getCellItem(models[index]);
          }),
    );
  }

  Widget _getCellItem(CellModel model) {
    return ListTile(
      title: Text(model.title),
      trailing: IconButton(
        icon: Icon(Icons.check_circle_outline,
            color: model.isSelected ? Colors.green : Colors.grey),
        onPressed: () {
          model.isSelected = !model.isSelected;
          setState(() {});
        },
      ),
    );
  }
}

class CellItem extends StatefulWidget {
  final CellModel model;

  CellItem({this.model});

  @override
  _CellItemState createState() => _CellItemState();
}

class _CellItemState extends State<CellItem> {
  @override
  Widget build(BuildContext context) {
    print('CellItem build ... index = ${widget.model.title}');
    return ListTile(
      title: Text(widget.model.title),
      trailing: IconButton(
        icon: Icon(Icons.check_circle_outline,
            color: widget.model.isSelected ? Colors.green : Colors.grey),
        onPressed: () {
          widget.model.isSelected = !widget.model.isSelected;
          setState(() {});
        },
      ),
    );
  }
}

Widget test() {
    return RepaintBoundary(

    );
}