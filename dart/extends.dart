
import 'Person.dart';

void main(List<String> args) {
  
  var stu = new Student();

  stu..name = 'jack'
     ..age  = 10
     ..study(); 


}
/** dart继承
 * 1.使用关键字entends继承一个类
 * 2.子类继承父类的可见属性和方法，不会继承构造函数
 * 3.子类能够复写父类的方法
 * 4.单继承，多态性
 * 5.继承需先父类 
 */


class Student extends Person {
  @override 
  bool get isAdult => age > 15;

  study(){
    String isAdultStr = isAdult? '已成年' : '未成年';
    print('$name = $age $isAdultStr');
  }

}










