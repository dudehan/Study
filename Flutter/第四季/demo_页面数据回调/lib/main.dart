

import 'package:flutter/material.dart';



void main() {

  runApp(MaterialApp(
    title:'xxx',
    home:FirstPage()
  )
  );
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('aaaa')),
      body: Center(
        child:RouteButton()
      ),
    );
  }
  
}

class RouteButton extends StatelessWidget {
  String name = 'anniu';
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(name),
      onPressed: (){
        // Navigator.push(context, MaterialPageRoute(builder: (x) => MySelect()));
        _navigateToSelect(context);
      }
      );
  }
  _navigateToSelect(BuildContext context) async{

      final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => MySelect()));
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
      // this.name = result;
      // print(result);

  }
}


class MySelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('')),
      body: Center(
        child: new Column(
          children:<Widget>[

            RaisedButton(onPressed: (){
              Navigator.pop(context,'apple');
            },
            child: Text('banana'),
            ),
            RaisedButton(onPressed: (){
              Navigator.pop(context,'banana');
            },
            child: Text('banana'),
            ),

          ]
        ) ,

      ),
    );
  }
}






