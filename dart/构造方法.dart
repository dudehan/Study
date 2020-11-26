// import 'Class.dart';

import 'Class.dart';

void main(List<String> args) {
  var person = Person('jack',10,'Male');
  print("name = ${person.name}\nagee = ${person.age}");

  var newPerson = Person.withAge(10, 'Male');
  print(newPerson.age);
} 


class Person {

  String name;
  int    age;
  final String gender;

  //默认构造函数为类名，如Person(){}
  //可自定义构造函数
    // Person(String name, int age) {
    //   this.name = name;
    //   this.age = age;
    // }
    //语法糖的形式,直接将传入的参数赋值
    //使用语法糖的形式，属性赋值在构造函数执行之前执行（先赋值，后调用构造函数）
    //语法糖方式可以对final修饰的对象进行修改，但必须保证该属性尚未赋值
    Person(this.name, this.age, this.gender);

    //多构造方法以类名开始.方法名的方式（如Person.name）

    Person.withName(this.name,this.gender);
    Person.withAge(this.age,this.gender);

}