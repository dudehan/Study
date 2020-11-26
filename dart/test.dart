
import 'closure.dart';
import 'dart:async';

main() {
  // var a =10;
  // print(a);
  // final b = 20; //final 修饰的变量只能只能赋值一次，不能用来修饰例和方法˜
  // const c = 30; 
  // print(b);
  // int x = 10; 

  // dynamic m = 10;
  // m = "xxxxx";

  // var list1 = [1,'1'];
  // print(list1);

  // var list = new List();
  // list.add("aaa");
  // list.add(111);
  // print(list);

  // Person p = Person();
  String a = 'aaa';

  print('是否相等 ：${identical(Person.str, a)}');

  // test();

  // P1 p1 = P1();
  // // ptest(p1);
  // p1..test()..test1();
timerTest();
}
void timerTest() {
  Timer.run(() {
    print('=====');
  });

  Future.delayed(Duration(seconds: 0));
}

class Person{
  static String str = 'aaa';
  void printStr() {
    print('str === $str');
  }
}


void test() {
  int a = 1 ^ 2;
  print(a);
}


abstract class Impl {

  void test();

}

class P1 extends Person implements Impl {

  @override
  void test() {
    print('xxxxx');
  }

  void test1(){
    print('test1');
  }

}

void ptest(Impl impl) {
  impl.test();
}