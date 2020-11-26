import 'package:flutter/material.dart';
import '../model/home_model.dart';
class HomePageDataProvide with ChangeNotifier {

  List<ListData> listData = [];

  refreshListData(ListData data, int index) {
    listData[index] = data;
    notifyListeners();
  }

  addListDate(List<ListData> data) {
    listData.addAll(data);
    notifyListeners();
  }

  xgetListData(List<ListData> data) {
    listData = data;
    notifyListeners();
  }

  
}