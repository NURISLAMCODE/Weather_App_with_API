// // To parse this JSON data, do
// //
// //     final currentWeatherData = currentWeatherDataFromJson(jsonString);

// import 'dart:convert';

// CurrentWeatherData currentWeatherDataFromJson(String str) =>
//     CurrentWeatherData.fromJson(json.decode(str));

// class CurrentWeatherData {
//   List<Weather>? weather;

//   Main? main;

//   Wind? wind;
//   Clouds? clouds;
//   int? dt;
//   // Sys? sys;

//   String? name;

//   CurrentWeatherData({
//     required this.weather,
//     required this.main,
//     required this.wind,
//     required this.clouds,
//     required this.dt,
//     required this.name,
//   });

//   factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
//       CurrentWeatherData(
//         weather:
//             List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
//         main: Main.fromJson(json["main"]),
//         wind: Wind.fromJson(json["wind"]),
//         clouds: Clouds.fromJson(json["clouds"]),
//         dt: json["dt"],
//         name: json["name"],
//       );
// }

// class Clouds {
//   int? all;

//   Clouds({
//     required this.all,
//   });

//   factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
//         all: json["all"],
//       );

//   Map<String, dynamic> toJson() => {
//         "all": all,
//       };
// }

// // class Coord {
// //   double? lon;
// //   double? lat;

// //   Coord({
// //     this.lon,
// //     this.lat,
// //   });

// //   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
// //         lon: json["lon"].toDouble(),
// //         lat: json["lat"].toDouble(),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "lon": lon,
// //         "lat": lat,
// //       };
// // }

// class Main {
//   int? temp;

//   int? tempMin;
//   int? tempMax;

//   int? humidity;

//   Main({
//     required this.temp,
//     required this.tempMin,
//     required this.tempMax,
//     required this.humidity,
//   });

//   factory Main.fromJson(Map<String, dynamic> json) => Main(
//         temp: json["temp"].toInt(),
//         tempMin: json["temp_min"].toInt(),
//         tempMax: json["temp_max"].toInt(),
//         humidity: json["humidity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "temp": temp,
//         "temp_min": tempMin,
//         "temp_max": tempMax,
//         "humidity": humidity,
//       };
// }

// // class Sys {
// //   int? type;
// //   int? id;
// //   String? country;
// //   int? sunrise;
// //   int? sunset;

// //   Sys({
// //     this.type,
// //     this.id,
// //     this.country,
// //     this.sunrise,
// //     this.sunset,
// //   });

// //   factory Sys.fromJson(Map<String, dynamic> json) => Sys(
// //         type: json["type"],
// //         id: json["id"],
// //         country: json["country"],
// //         sunrise: json["sunrise"],
// //         sunset: json["sunset"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "type": type,
// //         "id": id,
// //         "country": country,
// //         "sunrise": sunrise,
// //         "sunset": sunset,
// //       };
// //}

// class Weather {
//   String? main;

//   String? icon;

//   Weather({
//     required this.main,
//     required this.icon,
//   });

//   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
//         main: json["main"],
//         icon: json["icon"],
//       );
// }

// class Wind {
//   double? speed;
//   int? deg;

//   Wind({
//     required this.speed,
//     required this.deg,
//   });

//   factory Wind.fromJson(Map<String, dynamic> json) => Wind(
//         speed: json["speed"].toDouble(),
//         deg: json["deg"],
//       );

//   Map<String, dynamic> toJson() => {
//         "speed": speed,
//         "deg": deg,
//       };
// }

import 'dart:convert';

CurrentWeatherData currentWeatherDataFromJson(String str) =>
    CurrentWeatherData.fromJson(json.decode(str));

class CurrentWeatherData {
  CurrentWeatherData({
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.name,
  });

  List<Weather>? weather;

  Main? main;

  Wind? wind;
  Clouds? clouds;
  int? dt;

  String? name;

  factory CurrentWeatherData.fromJson(Map<String, dynamic> json) =>
      CurrentWeatherData(
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        clouds: Clouds.fromJson(json["clouds"]),
        dt: json["dt"],
        name: json["name"],
      );
}

class Clouds {
  Clouds({
    this.all,
  });

  int? all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

class Main {
  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.humidity,
  });

  int? temp;

  int? tempMin;
  int? tempMax;

  int? humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"].toInt(),
        tempMin: json["temp_min"].toInt(),
        tempMax: json["temp_max"].toInt(),
        humidity: json["humidity"],
      );
}

class Weather {
  Weather({
    this.main,
    this.icon,
  });

  String? main;

  String? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        main: json["main"],
        icon: json["icon"],
      );
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  double? speed;
  int? deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"].toDouble(),
        deg: json["deg"],
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
