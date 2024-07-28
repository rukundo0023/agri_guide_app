import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgritechHub',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Manrope',
      ),
      home: HomeScreen(),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/notifications': (context) => NotificationScreen(),
        '/weather': (context) => WeatherScreen(),
        '/marketprices': (context) => MarketPriceScreen(),
        '/cropproduction': (context) => CropProductionTechniquesScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgritechHub'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF708763)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task, color: Color(0xFF121712)),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/field_icon.svg',
              color: Color(0xFF708763),
            ),
            label: 'Fields',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF708763)),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, color: Color(0xFF708763)),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud, color: Color(0xFF708763)),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money, color: Color(0xFF708763)),
            label: 'Market Prices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Color(0xFF708763)),
            label: 'Crop Techniques',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/tasks');
              break;
            case 2:
              Navigator.pushNamed(context, '/fields');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
            case 4:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 5:
              Navigator.pushNamed(context, '/weather');
              break;
            case 6:
              Navigator.pushNamed(context, '/marketprices');
              break;
            case 7:
              Navigator.pushNamed(context, '/cropproduction');
              break;
          }
        },
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Display local image from assets
              Image.asset(
                'assets/new_image.png', // Path to your local image
                width: 200,
                height: 200,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to AgritechHub',
                style: TextStyle(
                  color: Color(0xFF141C0D),
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 24 / 16,
                  fontFeatures: [FontFeature.enable('dlig')],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'The platform that connects you with the latest research, technology and innovations in agriculture.',
                style: TextStyle(
                  color: Color(0xFF141C0D),
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 24 / 16,
                  fontFeatures: [FontFeature.enable('dlig')],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color(0xFF141C0D),
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    height: 24 / 16,
                    fontFeatures: [FontFeature.enable('dlig')],
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF80E51A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
