
import 'dart:math';
import '二叉树.dart';

// 插值
void compareNode(Node<int> node, Node<int> newNode) {
    if (node.element == null) {
      node.element = newNode.element;
      return;
    }
    if(newNode.element < node.element) {
      if (node.left != null) {
        compareNode(node.left, newNode);
      } else {
        node.left = newNode;
        newNode.parent = node;
        // print('====== left ======');
        // print('node       === ${node.element}');
        // print('node.left === ${node.left?.element}');
      }
    } else if (newNode.element > node.element) {
      if (node.right != null) {
        compareNode(node.right, newNode);
      } else {
        node.right = newNode;
        newNode.parent = node;
        // print('====== right ======');
        // print('node       === ${node.element}');
        // print('node.right === ${node.right?.element}');
      }
    } else {
      print('xxxxxxxxxx');
    }
  }

// 插值2
void compareNode2(Node<int> node, Node<int> newNode) {

  Node<int> tempNode = node;
  while(tempNode.left?.element != newNode.element && tempNode.right?.element != newNode.element) {
    if (newNode.element < tempNode.element) {
      if (tempNode.left == null) {
        tempNode.left = newNode;
        // print('====== left ======');
        // print('node       === ${tempNode.element}');
        // print('node.left === ${tempNode.left?.element}');
        continue;
      } 
      tempNode = tempNode.left;
    } else if(newNode.element > tempNode.element) {
      if (tempNode.right == null) {
        tempNode.right = newNode;
        // print('====== right ======');
        // print('node       === ${tempNode.element}');
        // print('node.left === ${tempNode.right?.element}');
        continue;
      }
      tempNode = tempNode.right;
    }
  }

}

main(List<String> args) {

  // test1();

}



void test1() {
  List<int> list = [];
  for (var i = 0; i < 5000; i++) {
    int a = Random().nextInt(100000);
    print('a ========= $a');
    list.add(a);
  }
  Node<int> root = Node(element: 1);
  for (var value in list) {
    Node<int> node = Node(element: value);
    compareNode(root, node);
  }
  print('*******************');
  Node<int> root2 = Node(element: 1);
  for (var value in list) {
    Node<int> node = Node(element: value);
    compareNode2(root2, node);
  }
}