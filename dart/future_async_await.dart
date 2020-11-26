// main A - main B - foo A - foo value == null - 'bar A -
// main A - foo A - bar A - main B - foo value == hello bar
// main A - bar A - main B - foo value == hello bar - foo A

// main A - foo A - bar A - main B - foo value == hello bar - secondBar A - foo value == hello secondBar

/**
 * print('main A');
 * print('foo A'); 
 * print('bar A');
 * print('main B');
 * print('secondBar A');
 * print('foo value == hello bar');
 * print('foo value == hello secondBar');
 */

// void test() async {
//   String value2 = await secondBar();
//   print('foo value == hello bar');
//   print('foo value == $value2');
// }

// void test2() async {
//   print('foo value == hello bar');
//   print('foo value == hello secondBar');
// }

void main() {
  print('main A');
  // foo();

  afterTwoThings(first(), second());

  print('main B');
}

Future afterTwoThings(Future first, Future second) {
  return Future.wait([first, second]);
}

Future first() async {
  int a = 0;
  await print('a === $a');
  print('${a + 1}');
}
Future second() async {
  int b = 10;
  await print('a === $b');
  print('${b + 1}');
}

Future foo() async {
  print('foo A');
  String value = await bar();
  String value2 = await secondBar();

  print('foo value == $value');
  print('foo value == $value2');
}

bar() async {
  print('bar A');
  return 'hello bar';
}

secondBar() async {
  print('secondBar A');
  return 'hello secondBar';
}

/** eventQueue 事件队列任务排序
 * mian
 * //注释：foo 事件内部awit为一步执行(疑问：awit是将之后的代码包装成事件放在eventQueue最后面么？
 * foo (await事件之后的认为标识为 foo_awit_event,猜测是放到了main事件之后）
 * bar
 * mian函数到此运行结束，由于foo事件内部的异步任务被调度到了eventQueue队列的最后，所以main函数执行完执行foo_awit_event
 * foo_awit_event
*/

// main -> foo(foo_bar_awit(foo_secondBar_event)) -> bar -> foo_bar_awit -> foo_secondBar_event

// Main a -> foo A -> bar A -> main B -> foo first == hello bar -> secondBar A -> hello bar ->hello SecondBar
