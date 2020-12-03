import 'dart:async';
import 'dart:isolate';

const String WXIsolatePortKey = 'WXIsolatePortKey';

/// 子isolate可以调用主isolate中定义以static修饰的静态变量(与函数)及写在类外面的全局变量(与函数)
class WXIsolate {
  static Future<dynamic> addIsolateTask<T>(Function(T) callback, T arguments) async {
    /// 创建管道
    ReceivePort receivePort = ReceivePort();
    /// 创建新的Isolate
    Isolate isolate = await Isolate.spawn<SendPort>(packageTask, receivePort.sendPort);

    /// 创建Completer，用于返回future
    final Completer<T> result = Completer<T>();
    SendPort sendPort2;
    /// 监听管道消息
    receivePort.listen((data) {
      if (data is Map<String, dynamic> && data.containsKey(WXIsolatePortKey)) {
        /// 拿到receivePort2.sendPort
        sendPort2 = data[WXIsolatePortKey];
        /// 将参数及耗时任务通过sendPort2发送给子isolate
        Map param = {'message': arguments, 'callback': callback};
        sendPort2.send(param);
      } else {
        /// 这边收到最终执行完的结果
        result.complete(data);
        /// 拿到结果后关闭
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
    /// 监听回调，拿到主isolate的耗时操作并执行
    Function callback = data['callback'];
    /// 将执行完的结果再发送给主isolate
    sendPort.send(callback(data['message']));
  });
  /// 将receivePort2.sendPort发送个主isolate
  sendPort.send({WXIsolatePortKey: sendPort2});
}

/// 关闭通道及isolate
void closeIsolate(Isolate isolate, ReceivePort receivePort) {
  receivePort.close();
  isolate?.kill(priority: Isolate.immediate);
}
