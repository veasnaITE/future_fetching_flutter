void main(){
  print("first Operation");
  print("second big opertion");
  print("Third Operation");
  print("Last Operation");
  print(createsOrderMessage());
}
String createsOrderMessage(){
  var order = fetchUserOrder();
  return 'Your Order is: $order';
}
Future<String>fetchUserOrder()=> Future.delayed(Duration(seconds: 2), () => 'large latte',);