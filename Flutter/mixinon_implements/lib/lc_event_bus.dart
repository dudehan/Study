

import 'package:flutter/foundation.dart';

typedef Listen = Function(Object obj);


class LCEventBus {

    Map<String, dynamic> eventMaps = {};
    List eventList = [];
    Listen _onFunc;

    static LCEventBus _eventBus = LCEventBus.manager();

    LCEventBus.manager();
    factory LCEventBus() => _eventBus;

    on(Listen listen) {
        _eventBus._onFunc = listen;
    }

    fire(Object obj) {
        _eventBus._onFunc(obj);
    }
}