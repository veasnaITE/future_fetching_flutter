// void main() {
//   print(1);
//
//   var future = Future<int>.delayed(Duration(seconds: 1), () => 2);
//   future.then((value) => print(value));
//
//   print(3);
// }
Future<void> main() async {
  print(1);
  try {
    var value = await Future<int>.delayed(
        Duration(seconds: 0),
            () => throw Exception('An error from the future'));
    print(value);
  } catch (e) {
    print(e);
  }
  print(3);
}