总管：

MultiProvider

数据：

Providers:

​	1.Provider

​	2.ChangeNotifierProvider

​	3.ChangeNotifierProxyProvider



使用：

​	1.取值：Provider.of<T>(context).value

​	// 注意：listen: false 才会触发与context相关的组件rebuild

​	2.方法：Provider.of<T>(context,listen: false).increment();



​	3.Consumer包含组件，只rebuild被包含的组件，可减少不必要的刷新

+ Consumer可以在获取不到context的情况下来获取值。



​	













