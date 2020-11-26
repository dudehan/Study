
class BottomListModel {
  
  List<BottomListItemData> listData = [];
  BottomListModel(this.listData);

  BottomListModel.fromJosn(List data) {
    for (var item in data) {
      listData.add(BottomListItemData.fromJosn(item));
    }
  }
}

class BottomListItemData {

  String title;
  String imgUrl;
  bool type;

  BottomListItemData(this.title,this.imgUrl,this.type);

  BottomListItemData.fromJosn(Map<String, dynamic> json) {

    title = json['title'];
    imgUrl = json['imgUrl'];
    type = json['type'];

  }

  Map<String,dynamic> toJson() {

    Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['imgUrl'] = this.imgUrl;
    data['type'] = this.type;

    return data;
  }






}
