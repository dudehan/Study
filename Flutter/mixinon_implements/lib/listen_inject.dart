
import 'package:flutter/material.dart';

mixin AutoListen<T extends StatefulWidget> on State<T> {

    final int count = 0;
    @override
    void dispose() {
        print('AutoListen dispose : ...');
        super.dispose();
    }
    @override
    void initState() {
        print('AutoListen initState : ...');
        super.initState();
    }
}



abstract class LCState<T extends StatefulWidget> extends State<T> with AutoListen {

    @override
    void initState() {
        print('LCState initState : ... $count');
        super.initState();
    }

}