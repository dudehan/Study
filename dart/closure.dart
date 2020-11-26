void main(List<String> args) {
  
  var flag = 10;

  var func = test(count: flag);



  func();
  func();
  func();
  func();


  print("flag === $flag");

}

test({count = 5}) {
  // int count = 0;
  // printClosure(){
  //   print(++count);
  // };
  // return printClosure;

  return (){
    print(count++);
  };

}