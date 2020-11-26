import 'package:flutter/material.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
        title: 'welcome to flutter',
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'hello word',
              style: TextStyle(

              ),
            ),
            backgroundColor: Color.fromARGB(255, 200, 100, 222),
          ),
          body: Center(
            
            child: Container(
              child: new Text(
                'hello container',
                style:TextStyle(
                  color: Color.fromARGB(255, 111, 111, 111),
                  fontSize: 20,
                  )
                ),
              alignment: Alignment.topLeft,
              width: 500.0,
              height: 300.0,
              color: Colors.red,
              //内间距
              padding: const EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
              //外边距
              margin: const EdgeInsets.all(10.0),

              // decoration: new BoxDecoration(
              //   gradient: const LinearGradient(
              //     colors:[
              //       Colors.lightBlue,
              //       Colors.lightGreen,
              //       Colors.purple
              //     ]
              //   )
              // ),

            )
          
          ),
        ),
    );
  }


}