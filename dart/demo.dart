
abstract class Person {

  void run(){}
  void eat(){}

}

extension PersonExtension on Person {
  void sleep(){}
}


class Child extends Person {
  @override
  void eat() {}

  @override
  void run() {}

  
}

void main() {

  Child child = Child();
  child.sleep();
  
}


