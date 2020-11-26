
class Person {

  String name;
  String nickName;
  int age;
  double height;

  Person.fromJson(Map<String, dynamic> json) {
    this.name     = json['name'];
    this.nickName = json['nickName'];
    this.age      = json['age'];
    this.height   = json['height'];
  }

}