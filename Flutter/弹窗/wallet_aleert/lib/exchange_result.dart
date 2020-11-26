import 'package:flutter/material.dart';

class ExchangeResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _backButton(context),
            Image.asset('assets/images/index_three_icon.png'),
            Text('提交订单成功!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
            _instruction(),
            _exchangeListButton()
          ],
        ),
      ),
    );
  }

  Container _instruction() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text('限价订单设置成功，当汇率达到设定的数量时，SWFT将帮你自动完成兑换，'
          '您也可以在交易记录中查看订单或撤销订单，兑换成功订单不可以撤销'),
    );
  }

  Container _exchangeListButton() {
    return Container(
      width: 300,
      height: 45,
      margin: EdgeInsets.only(top: 60),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.5),
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
      ),
      child: FlatButton(
        onPressed: () {
          ///todo：跳转交易记录页

          print('xxxx');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.article_outlined,
              color: Colors.blue,
            ),
            Text(
              '交易记录',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22.5))),
      ),
    );
  }

  Container _backButton(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
