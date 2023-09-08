Future<String>getWethearForecast() async{
  return Future.delayed(Duration(seconds: 5),()=>
  'Party Cloudy'
  );
}
void fetchWeatherForcast() async{
  print("start: FetchWeatherForcase");
  var forcast = await getWethearForecast();
  //forcast.then((value) => print('result: $value'));
  print('result: $forcast');
  print('end :: fetchweather Forcase');
}
void main(){
  print("Start main");
  fetchWeatherForcast();
  print("End main");
}