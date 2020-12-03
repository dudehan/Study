import 'package:flutter/cupertino.dart';

class CellModel {
  String title;
  bool isSelected;

  CellModel({this.title = 'title', this.isSelected = false});
}

class LCProvider extends NotificationListener {
  final List<CellModel> _listModels = [];
  List<CellModel> get listModels => _listModels;

  _generateListModels() {
    for (int i = 0; i < 30; i++) {
      _listModels.add(CellModel(title: 'title_$i'));
    }
  }
}
