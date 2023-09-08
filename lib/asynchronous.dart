// void main() {
//   print("First Operation");
//   Future.delayed(Duration(seconds:3),()=>print('Second Big Operation'));
//   print("Third Operation");
//   print("Last Operation");
// }
Future<String> createOrderMessage() async {
  print("Hello world");
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}
Future<String> fetchUserOrder() =>
    Future.delayed(
      const Duration(seconds: 2),
          () => 'Large Latte',
    );
Future<void> main() async{
  print("fetching user order......");
  print( await createOrderMessage());
}
