Future<String> middleFunction(){
  return Future.delayed(Duration(seconds: 5),() => "hello",);
}
void getData()async{
  try{
    String data = await middleFunction();
    print(data);
  }catch(err){
    print("Some error $err");
  }
}
void main(){
  getData();
}