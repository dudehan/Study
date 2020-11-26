

void main(List<String> args) {
   
    var rect = new Rect();
    rect.width = 10;
    rect.height = 5;
    print(rect.area);
    print(rect.area1());
}

class Rect {

  num width, height;
  //area 是一个计算属性，通过width * height获得
  // num get area {
  //   return width * height;
  // }
  //简化写法
  num get area => width * height;
  // set area(value) {
  //     width = value;
  // }

  
  num area1() {
      return width * height;
  }


}
