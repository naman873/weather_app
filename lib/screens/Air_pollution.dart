import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';

class Air_pollutionn extends StatefulWidget {
  Air_pollutionn({this.weatherData});

  var weatherData;
  @override
  _Air_pollutionnState createState() => _Air_pollutionnState();
}

class _Air_pollutionnState extends State<Air_pollutionn> {
  WeatherModel weather = WeatherModel();

  var Air_quality_index;
  var Carbon_monoxide;
  var Nitrogen_monoxide;
  var Nitrogen_dioxide;
  var Ozone;
  var Sulphur_dioxide;
  var Fine_particles_matter;
  var Coarse_particulate_matter;
  var Ammonia;

  @override
  void initState() {
    super.initState();
    var finalData = widget.weatherData;
    showData(finalData);
  }

  void showData(Data) {
    Air_quality_index = Data['list'][0]['main']['aqi'];
    Carbon_monoxide=Data['list'][0]['components']['co'];
    Nitrogen_monoxide=Data['list'][0]['components']['no'];
    Nitrogen_dioxide=Data['list'][0]['components']['no2'];
    Ozone=Data['list'][0]['components']['o3'];
    Sulphur_dioxide=Data['list'][0]['components']['so2'];
    Fine_particles_matter=Data['list'][0]['components']['pm2_5'];
    Coarse_particulate_matter=Data['list'][0]['components']['pm10'];
    Ammonia=Data['list'][0]['components']['nh3'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
      child: Column(children: [
        SizedBox(
          height: 40.0,
        ),
        Text(
          'Air Quality Index. Possible values: 1, 2, 3, 4, 5.                   Where 1 = Good, 2 = Fair, 3 = Moderate, 4 = Poor, 5 = Very Poor',
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text(
          'Current Air Quality Index is $Air_quality_index',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.cyan),
        ),
        SizedBox(
          height: 40.0,
        ),
        Text("Present Components are => "
            "Carbon_monoxide  $Carbon_monoxide , Nitrogen_monoxide  $Nitrogen_monoxide ,"
            "   Nitrogen_dioxide  $Nitrogen_dioxide, Ozone  $Ozone"
            "     Sulphur_dioxide  $Sulphur_dioxide , "
            "Sulphur_dioxide   $Fine_particles_matter,"
            " Coarse_particulate_matter $Coarse_particulate_matter ,"
            " Ammonia $Ammonia ",style: TextStyle(
          fontSize: 20.0
        ),)
      ],),
    ),);
  }
}
