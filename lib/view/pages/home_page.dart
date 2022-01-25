import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';

import 'package:weather_app/view/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  WeatherModel? weatherD;

  @override
  Widget build(BuildContext context) {
    weatherD = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather APP'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Provider.of<WeatherProvider>(context).weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'There is no weather 😔 start !',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'Search now 🔍',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            )
          : Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherD!.getThemeColor(),
                    weatherD!.getThemeColor()[300]!,
                    weatherD!.getThemeColor()[100]!,
                  ],
                      begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Provider.of<WeatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'udDate at: ${weatherD!.applicableDate.hour.toString()}:${weatherD!.applicableDate.minute.toString()}',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(weatherD!.getImage()),
                      Text(
                        '${weatherD!.theTemp.toInt()}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Column(
                        children: [
                          Text('maxTemp :${weatherD!.maxTemp.toInt()}'),
                          Text('minTemp : ${weatherD!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    '${weatherD!.weatherStateName}',
                    style: TextStyle(fontSize: 30),
                  )
                ],
              ),
            ),
    );
  }
}
