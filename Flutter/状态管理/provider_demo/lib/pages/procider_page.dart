import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/p_provider.dart';
import '../models/provider_model.dart';
import '../providers/count.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Text(
            '${Provider.of<MyProvider>(context).model.itemData.count}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ///不传listen必须传false数据才会发生改变
          Provider.of<MyProvider>(context,listen: false).updateCount();
          // Provider.of<Counter>(context).increment();
          // Provider.of<Counter>(context,listen: false).increment();
        },
      ),
    );
  }
}
