// Future<String> getUserName() {
//   return Future.value('Mark');
// }
// void main(){
//
//   print("startt");
//  print( '$getUserName()');
//  print("end");
//
//
// }
// function that returns a future
Future<String> getUserName() async {
  return Future.delayed(Duration(seconds: 2), () => 'Mark');
}
// main function
void main() {
  print("Start");
  getUserName().then((value) => print(value));
  print("End");
}
