/** Mixins 
 * 类似于多继承，是在多类继承中重用一个类代码的方式
 * 作为Mixins的类不能有显示申明构造函数
 * 作为Mixins的类只能继承自Object
 * 使用with连接一个或多个mixin
 */


class A {
  void a(){
    print('A');
  }
}
class B {
  void b(){
    print('B');
  }
}

class C {
  void c(){
    print('C');
  }
}

// class D extends A with B,C {
// }
//如果D类内没有自己的属性则可简写
class D = A with B,C;


enum type {
    old,
    nnn,
    xxx
}