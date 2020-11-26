

void main(List<String> args) {

  var fuc = (name){
    print("hello --- $name");
  };
  fuc('jack');   

  ((name){
    print('hello --- $name');
  })('tom');


  var str1 = "abc";
  var str = str1 * 3;
  var str2 = str * 3;
  print("str = $str,str2 = $str2");


  print(getNewString("lancai", (){return 3;}));

}
//将一个匿名函数当参数传递
String getNewString(oldStr, int times()) {
  
  return oldStr * times();
}


