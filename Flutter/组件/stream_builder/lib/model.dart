import 'dart:async';

abstract class BaseViewModel<T> {
  StreamController _dataSourceController = StreamController<T>.broadcast();

//  Sink get inputData => _dataSourceController;

  Stream get outputData => _dataSourceController.stream;

  addData(T data) {
    _dataSourceController.add(data);
  }

  addError(Object e) {
    _dataSourceController.addError(e);
  }

  dispose() {
    _dataSourceController.close();
  }
}

class OrderResultModel {
  String errorId;
  String errorMsg;

  static OrderResultModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    OrderResultModel orderResultModelBean = OrderResultModel();
    orderResultModelBean.errorId = map['errorId'];
    orderResultModelBean.errorMsg = map['errorMsg'];
    return orderResultModelBean;
  }

  Map toJson() => {
        "errorId": errorId,
        "errorMsg": errorMsg,
      };
}

class OrderResultViewModel extends BaseViewModel<OrderResultModel> {
  void fetchOrderResultData() {
      Future.delayed(Duration(milliseconds: 500),(){
          Map<String, dynamic> response = {
              "errorId": 'errorId',
              "errorMsg": 'errorMsg',
          };
          OrderResultModel model = OrderResultModel.fromMap(response);
          addData(model);
      });

  }

  Stream<OrderResultModel> get outOrderResultModel {
    return outputData.map((orderResultModel) {
      return orderResultModel;
    });
  }
}
