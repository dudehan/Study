
void main() {

  // String str = getPerson(18,"jack");
  // print(str);

  Child child = Child();
  if (child is Person) {
    print('true');
  } else {
    print('false');
  }
}

class Person {
  String name;
  Person({this.name});

}

class Child extends Person {
  int age;
  Child({this.age}); 

}




getPerson(age, name) => "age = $age, name = $name";

// String getPerson(int age, String name) {
  
//   // print("age = $age, name = $name");
//   return "age = $age, name = $name";

// }  
