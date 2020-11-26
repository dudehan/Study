
import 'dart:ui';


class SizeFit {

    static double physicalWidth;
    static double physicalHeight;
    static double screenWidth;
    static double screenHeight;

    static double dpr;

    static double rpx;
    static double px;

    static initialize({double standardSize = 750}) {
        ///获取物理宽高像素
        physicalWidth = window.physicalSize.width;
        physicalHeight = window.physicalSize.height;

        ///设置dpr
        dpr = window.devicePixelRatio;

        ///设置屏幕宽高
        screenWidth = physicalWidth / dpr;
        screenHeight = physicalHeight / dpr;

        ///设置rpx
        rpx = screenWidth / standardSize;
        ///设置px
        px = rpx * 2;

        window.textScaleFactor;
    }
}

///扩展
extension fit on int {

    double get rpx {
        return this.toDouble() * SizeFit.rpx;
    }

    double get px {
        return this * SizeFit.px;
    }

}