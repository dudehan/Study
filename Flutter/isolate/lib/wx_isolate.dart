import 'dart:async';
import 'dart:isolate';

typedef WXVoidCallback = Function(dynamic);

const String WXIsolatePortKey = 'WXIsolatePortKey';

///  子isolate可以调用主isolate中定义以static修饰的静态变量(与函数)及写在类外面的全局变量(与函数)

class WXIsolate {
  static Future<dynamic> addIsolateTask<T>(
      Function(T) callback, T arguments) async {
    // 1.创建管道
    ReceivePort receivePort = ReceivePort();
    SendPort sendPort2;
    // 2.创建新的Isolate
    Isolate isolate =
        await Isolate.spawn<SendPort>(packageTask, receivePort.sendPort);

    // 创建Completer，用于返回future
    final Completer<T> result = Completer<T>();
    // 3.监听管道消息
    receivePort.listen((data) {
      if (data is Map<String, dynamic> && data.containsKey(WXIsolatePortKey)) {
        sendPort2 = data[WXIsolatePortKey];
        Map<String, dynamic> param = {
          'message': arguments,
          'callback': callback
        };
        sendPort2.send(param);
      } else {
        result.complete(data);
        closeIsolate(isolate, receivePort);
      }
    }, onError: (error) {
      closeIsolate(isolate, receivePort);
    });
    return result.future;
  }
}

void packageTask(SendPort sendPort) {
  ReceivePort receivePort2 = ReceivePort();
  SendPort sendPort2 = receivePort2.sendPort;
  receivePort2.listen((data) {
    WXVoidCallback callback = data['callback'];
    sendPort.send(callback(data['message']));
  });
  sendPort.send({WXIsolatePortKey: sendPort2});
}

// 关闭通道及isolate
void closeIsolate(Isolate isolate, ReceivePort receivePort) {
  receivePort.close();
  isolate?.kill(priority: Isolate.immediate);
}
