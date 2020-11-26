import 'package:flutter/material.dart';
import 'wallet_import_details.dart';

class WalletImport extends StatefulWidget {
  @override
  _WalletImportState createState() => _WalletImportState();
}

class _WalletImportState extends State<WalletImport> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(112, 112, 112, 112),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _importCard('硬件钱包', 'assets/images/wallet_hd_bg.png', context),
            _importCard('蓝牙钱包', 'assets/images/wallet_blue_bg.png', context),
            _importCard('助记词导入', 'assets/images/wallet_key_bg.png', context),
            _importCard('私钥导入', 'assets/images/wallet_key_bg.png', context),
            _deleteIcon(context),
            ListView(),
          ],
        ),
      ),
    );
  }
}

Widget _importCard(String title, String image, BuildContext context) {
  return GestureDetector(
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Positioned(
          left: 45,
          right: 45,
          height: 120,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 45, right: 45,),
          height: 120,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(title,style: TextStyle(color: Colors.white),),
          ),
        ),
      ],
    ),
    onTapUp: (details) {
      print(title);
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return WalletDetails();
      }));
    },
  );
}

Widget _deleteIcon(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 25),
    child: IconButton(
      iconSize: 35,
      icon: Icon(Icons.cancel_outlined, color: Colors.white),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}

/// [WXDialogRoute]为[_DialogRoute]组件的拷贝，因为是私有类，外部无法使用，所以自己拷贝一份出来
/// 具体见[routes.dart]
class WXDialogRoute<T> extends PopupRoute<T> {
  WXDialogRoute({
    @required RoutePageBuilder pageBuilder,
    bool barrierDismissible = true,
    String barrierLabel,
    Color barrierColor = const Color(0x10000000),
    Duration transitionDuration = const Duration(milliseconds: 200),
    RouteTransitionsBuilder transitionBuilder,
    RouteSettings settings,
  })  : assert(barrierDismissible != null),
        _pageBuilder = pageBuilder,
        _barrierDismissible = barrierDismissible,
        _barrierLabel = barrierLabel,
        _barrierColor = barrierColor,
        _transitionDuration = transitionDuration,
        _transitionBuilder = transitionBuilder,
        super(settings: settings);

  final RoutePageBuilder _pageBuilder;

  @override
  bool get barrierDismissible => _barrierDismissible;
  final bool _barrierDismissible;

  @override
  String get barrierLabel => _barrierLabel;
  final String _barrierLabel;

  @override
  Color get barrierColor => _barrierColor;
  final Color _barrierColor;

  @override
  Duration get transitionDuration => _transitionDuration;
  final Duration _transitionDuration;

  final RouteTransitionsBuilder _transitionBuilder;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      child: _pageBuilder(context, animation, secondaryAnimation),
      scopesRoute: true,
      explicitChildNodes: true,
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (_transitionBuilder == null) {
      return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.linear,
          ),
          child: child);
    } // Some default transition
    return _transitionBuilder(context, animation, secondaryAnimation, child);
  }
}
