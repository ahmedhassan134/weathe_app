import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/view/pages/home_page.dart';
class SearchPage extends StatelessWidget {
  String ? cityName;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Search a city'),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            decoration:  InputDecoration(

              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 16),
              border: OutlineInputBorder(),
              label: Text('Search'),
              hintText: 'Enter your city',
              suffixIcon: GestureDetector(
                onTap: ()async{

                  WeatherService service =WeatherService();
                  WeatherModel ? weather= await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context,listen: false).weatherData =weather;
                  Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;

                  Navigator.pop(context);


                },


                  child: Icon(Icons.search)),

            ),
            keyboardType:TextInputType.text ,
            onChanged: (data){
              cityName=data;

            },

            onFieldSubmitted: (data) async{
           cityName=data;
           WeatherService service =WeatherService();
           WeatherModel ? weather= await service.getWeather(cityName: cityName!);
           Provider.of<WeatherProvider>(context,listen: false).weatherData =weather;
           Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;

           Navigator.pop(context);






            },
          ),
        ),
      ),
    );
  }
}
