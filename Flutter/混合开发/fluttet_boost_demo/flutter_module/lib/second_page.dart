import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  void initState() {
    FlutterBoost.singleton.addBoostContainerLifeCycleObserver((ContainerLifeCycle state, BoostContainerSettings settings) {

      print('secondPage ContainerLifeCycle : $state');
      switch (state) {
        case ContainerLifeCycle.Appear:
          break;
        default:
      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
        leading: IconButton(
          onPressed: (){
//            FlutterBoost.
            BoostContainerSettings settings =
                    BoostContainer.of(context).settings;
            FlutterBoost.singleton.close(settings.uniqueId,
                    result: {"result": "data from second"});
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Text('flutter'),
      ),
    );
  }
}
