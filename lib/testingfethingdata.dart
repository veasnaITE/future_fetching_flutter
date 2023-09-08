import 'package:http/http.dart' as http;
void fetchData() async{
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var respone = await http.get(url);
  if(respone.statusCode == 200){
    var data = respone.body;
    print(data);
  }else {
    print("Request failed with status: ${respone.statusCode}");
  }
}
void main(){
  fetchData();
}
