import 'package:clima/screens/UV_index.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clima/screens/Air_pollution.dart';
import 'package:clima/services/weather.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;
  WeatherModel weather = WeatherModel();

  Future<dynamic> getData() async {
    var weatherData = await weather.Airpoll();
    return weatherData;
  }

  Future<dynamic> getDataa() async {
    var weatherData = await weather.UV();
    return weatherData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: KTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  FlatButton(
                    padding: EdgeInsets.only(left: 10),
                    onPressed: () async {
                      var weatherData = await getData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Air_pollutionn(
                              weatherData: weatherData,
                            );
                          },
                        ),
                      );
                    },
                    child: Icon(
                      FontAwesomeIcons.smog,
                      size: 60,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Air Pollution',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  FlatButton(
                    onPressed: () async{
                      var weatherData = await getDataa();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return UV(weatherData: weatherData,);
                          },
                        ),
                      );
                    },
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(FontAwesomeIcons.radiation, size: 60),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Ultraviolet Index',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
