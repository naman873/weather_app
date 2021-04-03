import 'package:flutter/material.dart';

class UV extends StatefulWidget {
  UV({this.weatherData});

  var weatherData;

  @override
  _UVState createState() => _UVState();
}

class _UVState extends State<UV> {
  var uv_value;

  @override
  void initState() {
    super.initState();
    var final_data = widget.weatherData;
    get_data(final_data);
  }

  void get_data(Data) {
    uv_value = Data['value'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
              ),
              Text(
                "UV value of current location is $uv_value",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
