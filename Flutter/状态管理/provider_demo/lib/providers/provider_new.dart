import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import '../models/provider_model.dart';


class MyNewProvider with ChangeNotifier {
  int _count = 10;
  get count => _count;

  // ProviderPageModel model = ProviderPageModel.fromJson({});

  // void setModel(ProviderPageModel newModel) {
  //   model = newModel;
  //   print('${model.itemData.count}');
  //   notifyListeners();
  // }

  // void updateCount() {
  //   model.itemData.count += 1;
  //   _count ++;
  //   notifyListeners();
  // }
}