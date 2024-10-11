import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCity = 'London';

  // Sample weather data with an added city selection
  final List<Map<String, String>> _weatherData = [
    {'day': 'Monday', 'temp': '18°C', 'uvIndex': 'High', 'windSpeed': '3 mph'},
    {'day': 'Tuesday', 'temp': '20°C', 'uvIndex': 'High', 'windSpeed': '3 mph'},
    {
      'day': 'Wednesday',
      'temp': '21°C',
      'uvIndex': 'High',
      'windSpeed': '3 mph'
    },
    {
      'day': 'Thursday',
      'temp': '22°C',
      'uvIndex': 'High',
      'windSpeed': '3 mph'
    },
    {'day': 'Friday', 'temp': '23°C', 'uvIndex': 'High', 'windSpeed': '3 mph'},
    {
      'day': 'Saturday',
      'temp': '20°C',
      'uvIndex': 'High',
      'windSpeed': '3 mph'
    },
    {'day': 'Sunday', 'temp': '19°C', 'uvIndex': 'High', 'windSpeed': '3 mph'},
  ];

  final List<String> _cities = [
    'London',
    'New York',
    'Tokyo',
    'Sydney',
    'Paris',
    'Berlin',
    'Dubai',
    // Add more cities as needed
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredWeatherData = _weatherData
        .where(
            (weather) => weather['day']!.toLowerCase().contains(_searchQuery))
        .toList();

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
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Day',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search), // Add search icon
                    ),
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedCity,
                  onChanged: (String? newCity) {
                    setState(() {
                      _selectedCity = newCity!;
                    });
                    // Fetch weather data for the selected city if you had real data
                  },
                  items: _cities.map<DropdownMenuItem<String>>((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredWeatherData.length,
                itemBuilder: (context, index) {
                  final weather = filteredWeatherData[index];
                  return WeatherCard(
                    day: weather['day']!,
                    temp: weather['temp']!,
                    uvIndex: weather['uvIndex']!,
                    windSpeed: weather['windSpeed']!,
                  );
                },
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

  WeatherCard({
    required this.day,
    required this.temp,
    required this.uvIndex,
    required this.windSpeed,
  });

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
