/** 抽象类 */





/** 
 *  1.抽象类不能直接被实例化
 *  2.抽象方法不用abstract修饰，无实现
 *  3.抽象类可以没有抽象方法
 *  4.有抽象方法的类必须得申明为抽象类
 */
abstract class Person {
  //抽象方法 ，javascript中 需在方法前添加abstract，dart中不需要
  void run();
  void work();
  void study(){}

}

// 通过继承使用抽象类
class Student extends Person {
  @override
  void run() {
    
  }

  @override
  void work() {
    
  }
  
}