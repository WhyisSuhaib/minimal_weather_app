class Weather{
  //need 3 variable for the weather
  final String cityName;
  final String temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  //method for the Json file
  factory Weather.fromJson(Map<String, dynamic> json){
    return Weather(
        cityName: json['name'],
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json['weather'][0]['main'],
    );
  }
}
