import 'package:flutter/material.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/view/pages/home_page.dart';
import 'package:weather_app/view/pages/search_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider<WeatherProvider>

    (
    create: (_)=>WeatherProvider(),

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<WeatherProvider>(context).weatherData ==null? Colors.blue:Provider.of<WeatherProvider>(context).weatherData!.getThemeColor()
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
