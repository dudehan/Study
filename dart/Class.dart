import '构造方法.dart';

void main(List<String> args) {
  
    var person = new Person();
    person.name = "jack";
    person.age  = 20;
    person.height = 167.0;

    print("sex = ${person.sex}");
    person.run();

    var child = new Child();
    child.name = "tom";
    child.run();
    print('child.sex = ${child.sex}');



    /** 对象操作符 */
    
    /** 1.条件访问'?'
     * dart不可以使用nil对象调用方法，会崩溃（oc中可以给nil对象发生消息）
     * 条件运算符'?',当person对象为空时调用方法不会崩溃
     */
    var person2;
    person2?.run();

    /** 2.类型转换 as
     * 与swift as相似
     */
    var person3;
    // (person3 as Person)?.run(); 此处person为nil，所以使用条件访问符'?'
    person3 = new Person();
    (person3 as Person).run();

    /** 3.是否指定类型 is，is！
     *  is 相当于oc的 isKindOfClass
     *  is! 时 is 的取反
     */
    var person4 = new Person();
    var child4 = new Child();
    if (person4 is Person) {
      print('person4 is Person');
    } else {
      print('person4 is not Person');
    }
    if (child4 is Person) {
      print('child4 is Person');
    } else {
      print('child4 is not Person');
    }

    /** 4.级联操作符 '..'
     *  先给属性赋值，然后返回当前对象
     */
    var person5 = new Person();
    // person4..name = 'rose'..age = 10..run();
    person5..name = 'jack'
           ..age  = 20
           ..run();
    // var p = new Person()..name = 'xxx';


    var dog = new Dog();
    dog('旺财');//调用的就是dog的call方法

}
//dart 下class自动生成getter与setter方法
// final 只生成getter方法
class Person {

  String name;
  int    age;
  double height;
  final String sex = 'men';

  void run() {
    print('running');
  }
}
class Child extends Person {

  void run() {
      print('child running');
  }

}

/** 对象call方法
 * 1.函数名必须为call，可传参,可返回值
 * 2.调用时直接用对象调用，如dog('xxx');
 */
class Dog {
  String name;
  call(name){
    print('$name 汪汪汪。。。。');
  }
}

