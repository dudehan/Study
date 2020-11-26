import 'package:flutter/material.dart';

class Application {

  /// 全局navigatorKey
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  /// 异常弹窗浮层
  static OverlayEntry overlayEntry;

  /// 是否为暗黑模式
  static bool isDark =
  MediaQuery.of(navigatorKey.currentState.context).platformBrightness ==
          Brightness.dark
          ? true
          : false;


  /// app开关控制
  static SwitchModel switchModel;

}

/// app开关控制
class SwitchModel {
  /// 是否显示异常弹窗
  bool isShowAbnormalToast;
  /// 是否开启暗黑模式
  bool isOpenDarkMode;

  SwitchModel({this.isShowAbnormalToast,
               this.isOpenDarkMode});

  SwitchModel.fromJson(Map<String,dynamic> json) {
    /// 默认都不开启
    isShowAbnormalToast = json['isShowAbnormalToast'] ?? false;
    isOpenDarkMode      = json['isOpenDarkMode'] ?? false;

  }

}









