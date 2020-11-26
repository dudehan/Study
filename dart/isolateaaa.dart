

import 'dart:async';
import 'dart:isolate';

Future<SendPort> initIsolate() async {
  Completer completer = new Completer<SendPort>();
  ReceivePort isolateToMainStream = ReceivePort();

  //监听来自子线程的消息
  isolateToMainStream.listen((data) {
    if (data is SendPort) {
      SendPort mainToIsolateStream = data;
      completer.complete(mainToIsolateStream);
    } else {
      print('[isolateToMainStream] $data');
    }
  });

  Isolate.spawn(newIsolate, isolateToMainStream.sendPort);
  //返回来自子isolate的sendPort
  return completer.future; 
}

void newIsolate(SendPort isolateToMainStream) {
  ReceivePort mainToIsolateStream = ReceivePort();
  //关键实现：把SendPort对象传回给主isolate
  isolateToMainStream.send(mainToIsolateStream.sendPort);

  //监听来自主isolate的消息
  mainToIsolateStream.listen((data) {
    print('[mainToIsolateStream] $data');
  });

  isolateToMainStream.send('This is from new isolate');
}

void main() async{
  print('xxx');
  SendPort mainToIsolate = await initIsolate();
  mainToIsolate.send('This is from main isolate');
}