

main(List<String> args) {
  
  Person p1 = Person();
  p1.name = 'aaa';
  Person p2 = Person();
  p2.name = 'bbb';
  p1.age = 10;

  print(identical(p1, p2));
  print(p1.name);
  print(p1.age);
  print(p2.name);
  print(p2.age);

}

class Person {
  
  String name;
  int age;
  static Person _instance = Person._internal();

  Person._internal(){
    print('_internal');
  }
  
  factory Person() => _instance;

}


