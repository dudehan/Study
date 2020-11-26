import 'package:flutter/material.dart';
import 'generated/l10n.dart';

class Application {

  /// 全局navigatorKey
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  /// 异常弹窗浮层
  static OverlayEntry overlayEntry;

}

extension WXLocales on String {
  
  String get locale {
    S s = S.of(Application.navigatorKey.currentState.context);
    print(this);
    return this;
  }
  
}










