import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/procider_page.dart';
import './pages/procider_page_new.dart';
import './providers/p_provider.dart';
import './pages/first_page.dart';
import './providers/count.dart';
import './providers/provider_new.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider不需要被监听，存储一些无需改变的数据
        Provider(create: (_) => MyNewProvider()),

        ///它会随着某些数据改变而被通知更新，也就是说，比如这个Model被用在多个page，
        ///那么当其中一处被改变时，他就应该告诉其他的地方，改更新了
        // ChangeNotifierProvider(create: (_)=>MyProvider()),
        ChangeNotifierProvider.value(value: MyProvider()),
        ChangeNotifierProvider(create: (_)=>Counter()),
        ///ChangeNotifierProxyProvider不仅要像ChangeNotifierProvider一样，通知更新，还要协调Model与Model之间的更新，
        ///比如一个ModelA依赖另一个ModelB，ModelB更新，他就要让依赖它的ModelA也随之更新
        // ChangeNotifierProxyProvider(create: null, update: null)
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ProviderPage() 
    ),
    );
  }
}
