
class HomeDataModel {

  List<ListData> data = [];
  HomeDataModel(this.data);

  HomeDataModel.fromJson(List json) {

    for (var item in json) {
      data.add(ListData.fromJosn(item));
    }
  
  }

}


class ListData {

  String title;
  String subTitle;
  int count;

  ListData(this.title,this.subTitle);

  ListData.fromJosn(Map<String,dynamic> json) {
    title    = json['title'];
    subTitle = json['subTitle'];
    count    = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = this.title;
    data['subTitle'] = this.subTitle;
    data['count'] = this.count;
    return data;
  }

}