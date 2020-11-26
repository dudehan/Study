
void main(List<String> args) {

  const person = const Person('jack', 10);
  print(person.name);
}

//常量构造方法，类内所有属性必须使用final修饰
class Person {

  final String name;
  final int    age;

  const Person(this.name,this.age);

  void run() {
    print('running');
  }
}




