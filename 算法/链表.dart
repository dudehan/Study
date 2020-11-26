
class Node<E> {
  
  E element;
  Node pre  = null;
  Node next = null;
  Node({this.element});

}
main(List<String> args) {
  /*
  Node node = getList();
  // 递归反转
  node = reserve(node);
  Node point = node;
  while (point != null) {
    print(point.element);
    point = point.next;
  } 
  print('----- 华丽的分割线 -----');
  // 非递归反转
  node = reserve2(node);
  point = node;
  while (point != null) {
    print(point.element);
    point = point.next;
  } 
  */
  // 双向链表
  Node linkList = getTwoWayLinkedList();
  linkList = insert(0, linkList);

  Node point = linkList;
  while (point != null) {
    print(point.pre?.element);
    print(point.element);
    print(point.next?.element);
    point = point.next;

    print('========');
  }
}

Node getList() {
  Node first = Node(element: 'first');
  for (var i = 0; i < 10; i++) {
    Node node = Node(element: 'node$i');
    node.next = first.next;
    first.next = node;
  }
  return first;
}

// 递归
Node reserve(Node head) {

  if (head == null || head.next == null) return head;

  Node newNode = reserve(head.next);
  head.next.next = head;
  head.next = null;
  return newNode;
}

// 非递归
Node reserve2(Node head) {

  if (head == null || head.next == null) return head;
  Node newList;
  while (head != null) {
    Node tempNode = head;
    head = head.next;
    tempNode.next = newList;
    newList = tempNode;
  }
  return newList;

}

// 双向链表
Node getTwoWayLinkedList() {
  Node linkList = Node();
  for (var i = 0; i < 10; i++) {
    Node node = Node(element: 'node$i');
    node.next = linkList;
    node.next.pre = node;
    // linkList.pre = node;
    linkList = node;
  }
  return linkList;
}

// 双向链表插值
Node insert(int index, Node head) {
  if(head == null || index < 0) return head;
  Node p = head;
  int i = 0;
  while(p != null) {
    if (index == i) break;
    p = p.next;
    i++;
  }
  Node newNode = Node(element: 'insertNode');
  newNode.pre = p.pre;
  if (p.pre != null) {
    p.pre.next = newNode;
  }
  newNode.next = p;
  p.pre = newNode;
  return head;
}

// 链表排序