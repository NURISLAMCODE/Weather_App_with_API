import 'package:http/http.dart' as http;
import 'package:weather_app/consts/strings.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/models/hourly_weathet_model.dart';

//var link =
// "https://api.openweathermap.org/data/2.5/weather?lat=$latitute&lon=$longitude&appid=$apiKey&units=metric";

// getCurrentWeather() async {
//   var res = await http.get(Uri.parse(link));
//   if (res.statusCode == 200) {
//     var data = currentWeatherDataFromJson(res.body.toString());
//     //  print("Data is return");
//     return data;
//   }
// }
getCurrentWeather(lat, long) async {
  var link =
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(link));
  if (res.statusCode == 200) {
    var data = currentWeatherDataFromJson(res.body.toString());

    return data;
  }
}

getHourlyWeather(lat, long) async {
  var hourlyLink =
      "http://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  var res = await http.get(Uri.parse(hourlyLink));
  if (res.statusCode == 200) {
    var data = hourlyWeatherDataFromJson(res.body.toString());
    print(" hourly Data is return");
    return data;
  }
}


// getHourlyWeather(lat, long) async {
//   var link = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$long&appid=$apiKey&units=metric";
//   var res = await http.get(Uri.parse(link));
//   if (res.statusCode == 200) {
//     var data = hourlyWeatherDataFromJson(res.body.toString());

//     return data;
//   }
// }