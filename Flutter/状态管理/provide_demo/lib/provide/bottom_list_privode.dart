import 'package:flutter/material.dart';
import '../model/bottom_list_model.dart';

class BottomListPrivode with ChangeNotifier {

  List<BottomListItemData> data = [];

  xgetListData(List<BottomListItemData> list) {
    data = list;
    notifyListeners();
  }

  refreshData(BottomListItemData itemData, int index) {
    data[index] = itemData;
    notifyListeners();
  }



}