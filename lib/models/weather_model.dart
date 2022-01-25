

import 'package:flutter/material.dart';

class WeatherModel {


  String weatherStateName;

  DateTime applicableDate;
  double minTemp;
  double maxTemp;
  double theTemp;

  WeatherModel({

    required this.weatherStateName,

    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
   required this.theTemp,

  });


  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(

    weatherStateName: json["weather_state_name"],


    applicableDate: DateTime.parse(json["created"]),
    minTemp: json["min_temp"],
    maxTemp: json["max_temp"],
    theTemp: json["the_temp"],

  );
  //
  Map<String, dynamic> toJson() => {

    "weather_state_name": weatherStateName,

    "applicable_date": applicableDate,
    "min_temp" : minTemp,
    "max_temp": maxTemp,
    "the_temp": theTemp,

  };
  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }


  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm' || weatherStateName == 'Thunder' ){
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}