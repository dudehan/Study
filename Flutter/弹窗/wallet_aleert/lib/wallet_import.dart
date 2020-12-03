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
      color: Color.fromRGBO(0, 0, 0, 0.3),
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
          ],
        ),
      ),
    );
  }
}

Widget _importCard(String title, String image, BuildContext context) {
  return GestureDetector(
    child: Stack(
      children: [
        Positioned(
          left: 45,
          right: 45,
          height: 120,
          child: Container(
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 45, right: 45),
          height: 120,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(title,style: TextStyle(color: Colors.white,fontSize: 18)),
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