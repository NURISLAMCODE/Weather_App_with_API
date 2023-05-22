import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:weather_app/models/current_weather_model.dart';
import 'package:weather_app/services/api_services.dart';

class MainController extends GetxController {
  @override
  void onInit() async {
    await getUserLocation();
    currentWeatherData = getCurrentWeather(latitude.value, longitude.value);
    hourlyWeatherData = getHourlyWeather(latitude.value, longitude.value);
    super.onInit();
  }

  var isDark = false.obs;
  var isloaded = false.obs;
  var currentWeatherData;
  var hourlyWeatherData;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  changeTheme() {
    isDark.value = !isDark.value;
    Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
  }

  getUserLocation() async {
    var islocationEnabled;
    var userPermission;
    islocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!islocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();

      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isloaded.value = true;
    });
  }
}
