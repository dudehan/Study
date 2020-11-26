
class Node<E> {
  E element;
  Node left = null;
  Node right = null;
  Node father = null;
  Node({this.element});
}

// typedef compareFunc = int Function<E extends Object>(E e1, E e2);

class LCCompareAble<E> {
  compareTo(E e) {
    print(this);
    // return (Node<int>)this.element - (Node<int>)e.element;
  }
}

main(List<String> args) {
  // Node node = Node(element: 1);
  // Node node1 = Node(element: 2);
  Person x = Person(10);
  Person y = Person(20);
  int a = x.compareTo(y);

}


class Person extends LCCompareAble {
  int age;
  Person(this.age);
}