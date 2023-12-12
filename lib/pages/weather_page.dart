import 'package:flutter/material.dart';
import 'package:minimalweatherapp/models/weather_model.dart';
import 'package:minimalweatherapp/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  //api key
  final _weatherService = WeatherService('b520485a4e09610724b6c439b3790b1c');
  Weather? _weather;

  //fetch Weather
  _fetchWeather() async{

    //Get current city
    String cityName= await _weatherService.getCurrentCity();

    //get weather for city
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }

    //Errors
    catch(e){
      print(e);
    }

  }

  //Weather Animation

  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //fetch weather on startup
    _fetchWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(_weather?.cityName ?? "Loading City.."),

            //temperature
            Text('${_weather?.temperature}°C')    //????????
          ],
        ),
      ),



    );
  }
}
