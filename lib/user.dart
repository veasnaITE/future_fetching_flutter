import 'dart:convert';
import 'package:http/http.dart' as http;
class User{
  int? id;
  String? name;
  String? username;
  String? email;
  User({this.id,this.name,this.username,this.email});
  factory User.fromJSON(Map<String,dynamic>json)=>User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"]
  );
}
Future<List<User>> getAllUsers() async{
  var response = await http.get(Uri.https('jsonplaceholder.typicode.com','users'));
  if(response.statusCode==200){
    var users = (jsonDecode(response.body) as List)
        .map((user) => User.fromJSON(user)).toList();
    return users;
  }else{
    throw Exception('Could not load users');
  }
}

void main() async {
  List<User> users = await getAllUsers();
  for (var user in users) {
    print('User ID: ${user.id}');
    print('User Name: ${user.name}');
    print('User Email: ${user.email}');
    print('-------------------');
  }
}
