import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Weather Forecast',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 28 / 22,
                fontFeatures: [FontFeature.enable('dlig')],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  WeatherCard(
                      day: 'Monday',
                      temp: '18°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Tuesday',
                      temp: '20°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Wednesday',
                      temp: '21°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Thursday',
                      temp: '22°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Friday',
                      temp: '23°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Saturday',
                      temp: '20°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                  WeatherCard(
                      day: 'Sunday',
                      temp: '19°C',
                      uvIndex: 'High',
                      windSpeed: '3 mph'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String day;
  final String temp;
  final String uvIndex;
  final String windSpeed;

  WeatherCard(
      {required this.day,
      required this.temp,
      required this.uvIndex,
      required this.windSpeed});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(day),
        subtitle:
            Text('Temp: $temp\nUV Index: $uvIndex\nWind Speed: $windSpeed'),
      ),
    );
  }
}
