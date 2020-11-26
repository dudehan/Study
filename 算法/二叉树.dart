import '二叉搜索树.dart';
import 'dart:math';

class Node<E> {
  E element;
  Node left = null;
  Node right = null;
  Node parent = null;
  Node({this.element, this.parent});
}

Node getTree(int depth) {
    Node tree = Node();
    tree.element = 1;
    int index = 1;
    generate(tree, index, depth);
    return tree;
  }
// 递归生成二叉树
void generate(Node father, int cur, int depth) {
  Node left = Node(element: father.element * 2);
  Node right = Node(element: left.element + 1);
  father.left = left;
  father.right = right;
  left.parent = father;
  right.parent = father;
  print('=============');
  print(father.element);
  // print(left.element);
  // print(right.element);
  cur ++;
  if (cur < depth) {
    generate(left,cur,depth);
    generate(right,cur,depth);
  }
}

/*  
* 前序遍历
* 
*/
void preorderTest() {
  Node root = getSearchTree();
  // preorder1(root);
  // preorder2(root);
  preorder3(root);
}

// 前序遍历法一： 迭代法
void preorder3(Node node) {
  print(node.element);
  // 向下
  Node nextNode = node.left ?? node.right;
  while(nextNode.left != null || nextNode.left != null) {
    // print('======== 1 ========= ');
    print(nextNode.element);
    nextNode = nextNode.left ?? nextNode.right;
  }
  print(nextNode.element);
  print('======== 1 ========= ');
  while(nextNode.parent != null) {
    // Node temp = nextNode.parent.left ?? nextNode.right;
    if (nextNode.parent.right != null && nextNode != nextNode.parent.right) {
      nextNode = nextNode.parent.right;
      print('${nextNode.element}');
    } else {
      nextNode = nextNode.parent;
    }
  }


 Node tempNode;
  // 没有子节点时向上
  while(nextNode == null && tempNode.parent != null) {
    if (tempNode.parent.right != null && tempNode.parent.right != tempNode) {
      nextNode = tempNode.parent.right;
      print(tempNode.element);
    } else {
      tempNode = tempNode.parent;
    }
  }
}
// 前序遍历法一： 非完美递归法
void preorder1(Node node) {
  print(node.element);
  // 向下
  Node nextNode = node.left ?? node.right;
  // 没有子节点时向上
  while(nextNode == null && node.parent != null) {
    if (node.parent.right != null && node.parent.right != node) {
      nextNode = node.parent.right;
    } else {
      node = node.parent;
    }
  }  

  if (nextNode != null) {
    preorder1(nextNode);
  }
}
// 前序遍历法一：递归
void preorder2(Node node) {
  if (node == null) return;
  print(node.element);
  preorder2(node.left);
  preorder2(node.right);
}
// 层序遍历
void layerOrder(Node node) {
  if (node == null) return;
  list.add(node);
  while(list.length > 0) {
    Node tempNode = list[0];
    print('element = ${tempNode.element}');
    if (tempNode.left != null) list.add(tempNode.left);
    if (tempNode.right != null) list.add(tempNode.right);
    list.removeAt(0);
  }
}

// 递归法求二叉树的高度
int height(Node node) {
  if (node == null) return 0;
  int leftHeight = height(node.left);
  print('left === $leftHeight');
  int rightHeight = height(node.right);
  print('right === $rightHeight,${node.right}');
  int result = leftHeight > rightHeight ? leftHeight : rightHeight;
  return result + 1;
}
// 迭代法求二叉树高度（层序遍历求）
int height2(Node node) {
  if (node == null) return 0;
  int height = 0;
  
  List list = [];
  list.add(node);
  int size = 1;
  while (list.length > 0) {
    Node tempNode = list[0];
    // print('tempNode === ${tempNode.element}');
    list.removeAt(0); 
    
    if (tempNode.left != null) list.add(tempNode.left);
    if (tempNode.right != null) list.add(tempNode.right);
    size --;
    if (size == 0) {
      height ++;
      size = list.length;
    } 
  }


  return height;
}


 Node getSearchTree() {
   List<int> list = [];
  for (var i = 0; i < 10; i++) {
    int a = Random().nextInt(1000);
    print('$a');
    list.add(a);
  }
  print('length = ${list.length}');
  Node<int> root = Node();
  for (var value in list) {
    Node<int> node = Node(element: value);
    compareNode(root, node);
  }
  return root;
 }

main(List<String> args) {
  // preorderTest();
  Node node = getSearchTree();
  // print('height = ${height(node)}');
  // layerOrder(node);
  print('height2 === ${height2(node)}');

}
List<Node> list = [];






