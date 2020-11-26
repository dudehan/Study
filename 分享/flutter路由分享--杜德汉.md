#### 1、命名路由

##### 1.1、基本跳转

我们可以通过创建一个新的Route，使用Navigator来导航到一个新的页面，但是如果在应用中很多地方都	需要导航到同一个页面（比如在开发中，首页、推荐、分类页都可能会跳到详情页），那么就会存在很多重复	的代码。

在这种情况下，我们可以使用**命名路由（named route）**

- 命名路由是将名字和路由的映射关系，在一个地方进行统一的管理
- 有了命名路由，我们可以通过`Navigator.pushNamed()` 方法来跳转到新的页面

命名路由在哪里管理呢？可以放在MaterialApp的 `initialRoute` 和 `routes` 中

- `initialRoute`：设置应用程序从哪一个路由开始启动，设置了该属性，就不需要再设置`home`属性了
- `routes`：定义名称和路由之间的映射关系，类型为Map<String, WidgetBuilder>

修改MaterialApp中的代码：	

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: Application.navigatorKey,
      /// 路由配置
      routes: {
        RoutePath.homePage: (ctx) => HomePage(),
        RoutePath.firstPage: (ctx) => FirstPage(),
        RoutePath.secondPage: (ctx) => SecondPage(),
        RoutePath.thirdPage: (ctx) => ThirdPage(),
      },
      initialRoute: WXRouter.initialRoute,
    );
  }
}
```

修改跳转的代码：

```dart
/// RoutePath.firstPage = '/firstPage'
Navigator.of(context).pushNamed(RoutePath.firstPage);
```



##### 1.2、参数传递

因为通常命名路由，我们会在定义路由时，直接创建好对象，那么，命名路由如果有参数需要传递呢？	

pushNamed时，如何传递参数：

```dart
_onPushTap(BuildContext context) {
  Navigator.of(context).pushNamed(RoutePath.firstPage, arguments: "firstPage data");
}
```

在FirstPage中，如何获取到参数呢？

在build方法中ModalRoute.of(context)可以获取到传递的参数

```
final message = ModalRoute.of(context).settings.arguments;
```



##### 1.3. 路由钩子(onGenerateRoute)

假如我们有一个页面FirstPage，希望在跳转到FirstPage时，通过构造函数方式传参，

但是我们继续使用routes中的映射关系，就不好进行配置了，因为FirstPage必须要求传入一个参数；

这个时候我们可以使用onGenerateRoute的钩子函数：

- 当我们通过pushNamed进行跳转，但是对应的name没有在routes中有映射关系，那么就会执行onGenerateRoute钩子函数；

- 我们可以在该函数中，手动创建对应的Route进行返回；

- 该函数有一个参数RouteSettings，该类有两个常用的属性：

- - name: 跳转的路径名称
  - arguments：跳转时携带的参数

```dart
onGenerateRoute: (setting) {
  if (setting.name == RoutePath.firstPage){
    Map<String, dynamic> map = setting.arguments as Map<String, dynamic>;
    return MaterialPageRoute(builder: (ctx){
      return FirstPage(name: map['name'],age: map['age'],);
    });
  }
  return null;
},
```

如何调用呢？

```dart
/// push 
Navigator.of(context).pushNamed(RoutePath.firstPage, arguments: {'name':'jack'，'age':18});
/// popUntil
Navigator.of(context).popUntil(RoutePath.firstPage);
```



##### 1.4、flutter底层是如何实现通过命名路由方式跳转的？

+ 我们先看一下Navigator.of(context).pushNamed() 到底干了啥？

  + 在_routeNamed内调用了widget.onUnknownRoute函数，且传入了一个settings,这个settings包含了路由名称

    ```dart
    Route<T> _routeNamed<T>(String name, {@required Object arguments, bool allowNull = false }) {
      if (allowNull && widget.onGenerateRoute == null)
        return null;
      final RouteSettings settings = RouteSettings(
        name: name,
        arguments: arguments,
      );
      Route<T> route = widget.onGenerateRoute(settings) as Route<T>;
      if (route == null && !allowNull) {
        route = widget.onUnknownRoute(settings) as Route<T>;
      }
      return route;
    }
    ```

  + _onGenerateRoute内部又做了什么呢？

    ```dart
    Route<dynamic> _onGenerateRoute(RouteSettings settings) {
      final String name = settings.name;
      final WidgetBuilder pageContentBuilder = name == Navigator.defaultRouteName && 								widget.home != null
              ? (BuildContext context) => widget.home
              : widget.routes[name];
    		
      if (pageContentBuilder != null) {
      final Route<dynamic> route = widget.pageRouteBuilder<dynamic>(
      		settings,
      		pageContentBuilder,
      	);
      	return route;
      }
      if (widget.onGenerateRoute != null)
      	return widget.onGenerateRoute(settings);
      return null;
    }
    ```

    从上面可以看出，它内部是先去settings.name去widget.routes取出对应路由，如果找到了就将它封装成一个route（创建route时传入了settings），再返回出去，如果没找到则调用widget.onGenerateRoute这个回调函数，同时传入settings.

    那上面的widget.routes和widget.onGenerateRoute是哪来的呢？它们其实就是我们在MaterialApp内创建好的routes和onGenerateRoute

+ 那么popUntil()又是如何实现的呢？

  + 先看一下popUntil源码实现，发现是一个while循环实现pop的，那么关键就是在while的判断里了，

    predicate是一个传入进来的函数，这个函数是根据接收到的参数route来判断返回类型的，从它的内部判断中发现```route.settings.name == name```这样一句代码，这就说明了在路由创建的时候将我们定义的路由名称保存在了route.settings.name中，然后当我们调用popUntil时根据遍历路由栈判断route.settings.name是否与我们传入的name一致，不相同就一直pop，直到返回到与我们传入的name名称一致

    ```dart
    void popUntil(RoutePredicate predicate) {
      while (!predicate(_history.lastWhere(_RouteEntry.isPresentPredicate).route)) {
        pop();
      }
    }
    ```

    ```dart
    static RoutePredicate withName(String name) {
      return (Route<dynamic> route) {
        return !route.willHandlePopInternally
            && route is ModalRoute
            && route.settings.name == name;
      };
    }
    ```



##### 1.5、修改fluro源码实现命名路由跳转跨层返回

​	fluro目前并不支持pooUntil方式跳转

​	根据以上的分析我们可以知道，只要我们保证路由创建的时候将我们自己定义的路由名称保存到routeSettings中，那么我们就可以让fluro支持命名路由方式pop，这样我们就可以更加愉快的使用fluro了

+ 修改前源码

  ```dart
  if (routeSettings == null) {
    settingsToUse = RouteSettings(name: path);
  }
  ```

+ 修改后代码

  ```dart
  AppRouteMatch match = _routeTree.matchRoute(path);
  if (routeSettings == null) {
    if(path.contains('?')) {
      Map<String, List<String>> parameters =
              match?.parameters ?? <String, List<String>>{};
      List pathSplit = path.split('?');
      settingsToUse = RouteSettings(name: pathSplit.first,arguments: parameters);
    } else {
      settingsToUse = RouteSettings(name: path);
    }
  }
  ```



#### 2、路由实现原理

##### 2.1、关键类

+ Navigate：

  + 路由栈管理

  + 提供导航跳转API

+ Route:

  + 路由配置安装（包含动画初始化等）

  + 路由名称及参数设置

  + route继承关系：

    ```
    			Route					: 由Navigate管理的一个抽象类
    				|							(An abstraction for an entry managed by a [Navigator].)	
            |
     	OverlayRoute   		: 在导航器Overlay上显示的组件路由   
    				|							(A route that displays widgets in the [Navigator]’s [Overlay].)
      			|
     TransitionRoute		: push及pop动画管理
            |							(A route with entrance and exit transitions.)
      			|
       ModalRoute				: 一个阻止与以前路由交互的路由
            |						  (A route that blocks interaction with previous routes.)
            |
        PageRoute 			: 替换整个屏幕的模态路由
            |							(A modal route that replaces the entire screen.)
            |
    MaterialPageRoute/	
    CupertinoPageRoute	
              
    ```

+ _RouteEntry:

  + route生命周期管控
  + route生命周期监听通知
  
  

##### 2.2、 push及pop的流程

+ push几种方式

  + push
  + pushNamed
  + pushReplacementNamed
  + pushNamedAndRemoveUntil
  + pushReplacement
  + pushAndRemoveUntil

+ pop的几种方式

  + pop

  + popUntil

  + popAndPushNamed

    

+ 路由生命周期了解（_RouteLifecycle）：

  ```dart
  // The _RouteLifecycle state machine (only goes down):
  //
  //                    [creation of a _RouteEntry]
  //                                 |
  //                                 +
  //                                 |\
  //                                 | \
  //                                 | staging
  //                                 | /
  //                                 |/
  //                    +-+----------+--+-------+
  //                   /  |             |       |
  //                  /   |             |       |
  //                 /    |             |       |
  //                /     |             |       |
  //               /      |             |       |
  //      pushReplace   push*         add*   replace*
  //               \       |            |       |
  //                \      |            |      /
  //                 +--pushing#      adding  /
  //                          \        /     /
  //                           \      /     /
  //                           idle--+-----+
  //                           /  \
  //                          /    \
  //                        pop*  remove*
  //                        /        \
  //                       /       removing#
  //                     popping#       |
  //                      |             |
  //                   [finalizeRoute]  |
  //                              \     |
  //                              dispose*
  //                                 |
  //                                 |
  //                              disposed
  //                                 |
  //                                 |
  //                  [_RouteEntry garbage collected]
  //                          (terminal state)
  //
  // * These states are transient; as soon as _flushHistoryUpdates is run the
  //   route entry will exit that state.
  // # These states await futures or other events, then transition automatically.
  ```

+ push

  1、创建一个_RouteEntry对象并标记该对象的生命周期为push，将其添加进路由栈history

  2、路由安装（包括动画初始化及overlayEntry创建）

  3、调用动画，同时调用_updateSecondaryAnimation更新动画

  

+ pop

  1、调用entry.pop内部调用pop动画，状态设置为currentState = _RouteLifecycle.pop
  
  2、冲洗路由栈，调用当前entry.handPop修改状态currentState = popping
  
  3、动画结束退出popping状态，从history内移除，添加进toBeDisposed数组等待被释放



