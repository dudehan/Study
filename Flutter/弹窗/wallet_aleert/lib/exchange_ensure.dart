import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'exchange_result.dart';

class ExchangeEnsure extends StatefulWidget {
  @override
  _ExchangeEnsureState createState() => _ExchangeEnsureState();
}

class _ExchangeEnsureState extends State<ExchangeEnsure> {
  String fromCoin = 'BTC';
  String toCoin = 'ETH';

  String sendValue = '0.522445';
  String gainValue = '16.26448';

  String serviceCharge = '0.0002155';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('兑换确认')),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              _exchangeInfo(),
              Divider(height: 1, color: Color.fromRGBO(144, 144, 144, 1)),
              _description()
            ],
          ),
          _bottomButton(),
        ],
      ),
    );
  }

  Positioned _bottomButton() {
    return Positioned(
      bottom: 45,
      height: 45,
      width: 300,
      child: FlatButton(
        color: Colors.blue,
        onPressed: () {
          ///todo: PIN码验证
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) {
                return ExchangeResult();
              },
            ),
          );
        },
        child:
            Text('一键兑换', style: TextStyle(color: Colors.white, fontSize: 18)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22.5))),
      ),
    );
  }

  Container _exchangeInfo() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 30),
      child: Column(
        children: [
          _exchangeTitle(),
          Container(height: 30),
          _exchangeListTile('发送', '$sendValue$fromCoin'),
          _exchangeListTile('得到', '$gainValue$toCoin'),
          Container(height: 20),
          _exchangeListTile('当前汇率', '1$fromCoin = 32.522445$toCoin'),
          _exchangeListTile('手续费', '$serviceCharge$fromCoin'),
          Container(height: 30),
        ],
      ),
    );
  }

  Container _description() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 25),
      child: Text(
        '说明：'
        '\n1.若账户中速币充足，则默认使用速币支付手续费，费率0.1%；否则使用原币，费率0.2%。'
        '\n2.因交易所币价波动，兑换结果与显示稍有不一致，如寻求更精确的兑换欢迎使用SWFT限价兑换！'
        '\n3.若兑换失败，则原价返回代币。',
        style: TextStyle(color: Color.fromRGBO(112, 112, 112, 1)),
      ),
    );
  }

  Row _exchangeListTile(String title, String info) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(112, 112, 112, 1), fontSize: 18),
            ),
          ),
          flex: 1,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            alignment: Alignment.centerRight,
            child: Text(info, style: TextStyle(fontSize: 18)),
          ),
          flex: 2,
        )
      ],
    );
  }

  Row _exchangeTitle() {
    return Row(
      children: [
        Expanded(
          child: _avatar(
              'assets/images/btc_icon.png', 'BTC', Alignment.centerRight),
          flex: 2,
        ),
        Expanded(
          child: Image.asset('assets/images/change_right_icon.png'),
          flex: 1,
        ),
        Expanded(
          child: _avatar(
              'assets/images/eth_icon.png', 'ETH', Alignment.centerLeft),
          flex: 2,
        ),
      ],
    );
  }

  _avatar(String image, String title, Alignment alignment) {
    return Container(
      alignment: alignment,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
