import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var          weatherData  = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.00,
        ),
      )
    );
  }

}

/*
  void getData() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey'));
    if (response.statusCode == 200) {
      String data        = response.body;
      var decodeData     = jsonDecode(data);
      longitude          = decodeData['coord']['lon'];
      double temperature = decodeData['main']['temp'];
      int condition      = decodeData['weather'][0]['id'];
      String cityname    = decodeData['name'];
      print(response.body);
      print(longitude);
      print(temperature);
      print(condition);
      print(cityname);
    } else {
      response.statusCode;
    }
  }
 */