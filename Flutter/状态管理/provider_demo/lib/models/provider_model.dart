

class ProviderPageModel {

  // List<ListItemData> listData = [];

  ListItemData itemData;

  ProviderPageModel.fromJson(Map<String,dynamic> json) {

    // for (var item in json['postionListData']) {
    //   listData.add(ListItemData.fromJson(item));
    // }  

    Map<String, dynamic> data = {
      'totalPrice': 100.5,
      'totalProfit': 100.5,
      'sessionProfit': 100.5,
      'count': 10,
    };
    itemData = ListItemData.fromJson(data);

  }


}

class ListItemData {

  double totalPrice;
  double totalProfit;
  double sessionProfit;
  int    count;

  ListItemData(this.totalPrice,this.totalProfit,this.sessionProfit);

  ListItemData.fromJson(Map<String, dynamic> json) {
    totalPrice = json['totalPrice'];
    totalProfit = json['totalProfit'];
    sessionProfit = json['sessionProfit'];
    count = json['count'];
  }

   Map<String, dynamic> toJson() {

    Map<String, dynamic> json = {};
    json['totalPrice'] = this.totalPrice;
    json['totalProfit'] = this.totalProfit;
    json['sessionProfit'] = this.sessionProfit;
    json['count'] = this.count;
    return json;
  }

}
