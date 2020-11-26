import 'dart:convert';

import 'package:fluro_demo/pages/third_page.dart';
import 'package:flutter/material.dart';
// import 'package:fluro/fluro.dart';
import '../fluro/fluro.dart';

import '../pages/home_page.dart';
import '../pages/first_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

var firstPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FirstPage();
});
var secondPageHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = params["name"]?.first;
    String nickName = params["nickName"]?.first;
    int age = int.parse(params["age"]?.first);
    double height = double.parse(params["height"]?.first);
    String jsonString = params["jsonString"]?.first;

//    print('jsonString = $jsonString');

    return SecondPage(
      name: name,
      nickName: nickName,
      age: age,
      height: height,
      jsonString: jsonString,
    );
  },
);

var thirdPagePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ThirdPage();
});
