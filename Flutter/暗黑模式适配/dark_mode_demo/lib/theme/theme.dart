import 'package:flutter/material.dart';

class WXTheme {
  ///正常模式
  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.blue,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
        ///在norTheme主题下若字体颜色为白色，则无需在widget下设置颜色
        ///若颜色为带透明度的白色是否可以通过包裹一层Opacity设置？
        ),
    cardTheme: CardTheme(color: Colors.white),
    primaryColorBrightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black45),
    appBarTheme: AppBarTheme(color: Colors.white),

    ///分割线
    dividerTheme: DividerThemeData(
      color: Color.fromRGBO(221, 221, 221, 1),
      indent: 15,
      endIndent: 15,
      thickness: 1,
    ),
  );

  ///暗黑模式
  static final ThemeData darkTheme = ThemeData(
    ///注：当color有对应的theme时，底层优先使用theme
    ///可设置appBar 背景色，
    ///BottomNavigationBar的title及icon颜色(选中时)
    ///FloatingActionButton的背景色
    ///是primaryColor与accentColor的集合
//    primarySwatch: Colors.orange,
    ///可设置appBar 背景色，
    ///BottomNavigationBar的文字及icon颜色
//    primaryColor: Colors.orange,
    ///FloatingActionButton的背景色
//    accentColor: Colors.orange,

//    Brightness primaryColorBrightness,
//    Color primaryColorLight,
//    Color primaryColorDark,
    ///可设置BottomNavigationBar背景颜色
    canvasColor: Colors.black,

    ///只能设置scaffold body部分的背景颜色
    scaffoldBackgroundColor: Colors.red,

    ///可设置BottomAppBar 的背景色
    bottomAppBarColor: Colors.yellow,
    ///设置card背景色
    cardColor: Colors.black,
    ///分割线颜色
    dividerColor:Colors.grey,
//    focusColor:Colors.black,
    ///高亮颜色，有点击事件的组件被点击时的高亮颜色(但会使水波纹效果消失)
//    highlightColor: Colors.purple,
    ///inkwell水波纹的颜色（设置highlightColor会使该设置无效）
//    splashColor: Colors.blue,
    ///
//    selectedRowColor: Colors.pink,
    unselectedWidgetColor:Colors.black,
    ///可以设置Icon的颜色
    ///*对Card中的trailing及leading无效，Icon背景色默认为black45
    disabledColor: Colors.black,


    ///
    //    backgroundColor: Colors.yellow,
    ///设置card主题
    cardTheme: CardTheme(
      color: Colors.blueGrey,
    ),
//    buttonColor: Colors.yellow,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.yellow,
    ),

    textTheme: TextTheme(
      ///黑暗模式下若未设置颜色，则默然白色
//      display1: TextStyle(color: Colors.white),
      body1: TextStyle(color: Colors.white, fontSize: 20),
      ///可设置ListTitle中的title颜色及大小
      subhead: TextStyle(color: Colors.orange),
      ///可设置ListTitle中的subTitle颜色（大小设置不了，可在body1中设置）
      ///可设置BottomNavigationBar 中Icon及title的颜色（未选中时）
      caption: TextStyle(color: Colors.yellow),
    ),

////    bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
//    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.blueGrey),
//    appBarTheme: AppBarTheme(color: Colors.black),

//    primaryColorBrightness: Brightness.dark,

    ///可以设置Icon的主题样式(会顶替[disabledColor]设置)：see also:[disabledColor]
    ///*对Card中的trailing及leading无效，Icon背景色默认为black45
    ///注：按钮的文字颜色不是从theme中获取的
    iconTheme: IconThemeData(color: Colors.black),


    ///分割线
    dividerTheme: DividerThemeData(
      color: Color.fromRGBO(221, 221, 221, 1),
      indent: 15,
      endIndent: 15,
      thickness: 1,
    ),
  );
}
