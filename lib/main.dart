import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/booking': (context) => ConsultationBookingPage(),
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
            icon: Icon(Icons.home, color: Color(0xFF708763)),
            label: 'booking',
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
              Navigator.pushNamed(context, '/booking');
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
              Image.asset(
                'assets/images/new_image.png', // Path to your local image
                width: 200,
                height: 200,
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

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      'assets/eye_icon.svg',
                      width: 24,
                      height: 24,
                      color: Color(0xFF73964F),
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Define action for the button
              },
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF80E51A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(84, 40),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Already have an account? Log in',
                style: TextStyle(
                  color: Color(0xFF73964F),
                  fontFamily: 'Manrope',
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 21 / 14,
                  fontFeatures: [FontFeature.enable('dlig')],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Login Title
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Login',
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
            ),
            // Email ID Field
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // Password Field
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset(
                      'assets/eye_icon.svg',
                      width: 24,
                      height: 24,
                      color: Color(0xFF73964F),
                    ),
                    onPressed: () {
                      // Toggle password visibility
                    },
                  ),
                ),
              ),
            ),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Define action for the button
              },
              child: Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFF141C0D),
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF80E51A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: Size(84, 48),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
            // Forgot Password Link
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 20.0),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Define action for the button
                  },
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Color(0xFF73964F),
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            // New User Link
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  'New user? Register here',
                  style: TextStyle(
                    color: Color(0xFF73964F),
                    fontFamily: 'Manrope',
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New NotificationScreen class
class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Payment Due',
      'content':
          'Your payment of \$2000 for the purchase of 2,000 bales of hay is due in 3 days.',
    },
    {
      'title': 'New Task1',
      'content':
          'You have been assigned a new task. Task: Planting Corn on Field 1',
    },
    {
      'title': 'New Task2',
      'content':
          'You have been assigned a new task. Task: Harvesting Wheat on Field 2',
    },
    {
      'title': 'New Task3',
      'content':
          'You have been assigned a new task. Task: Watering Plants on Field 4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
              'Notifications',
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
            // Notifications list
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading:
                          Icon(Icons.notifications, color: Color(0xFF80E51A)),
                      title: Text(notifications[index]['title']!),
                      subtitle: Text(notifications[index]['content']!),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    ),
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

class ConsultationBookingPage extends StatefulWidget {
  @override
  _ConsultationBookingPageState createState() =>
      _ConsultationBookingPageState();
}

class _ConsultationBookingPageState extends State<ConsultationBookingPage> {
  DateTime _selectedDate = DateTime.now();

  void _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book A Consultation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Expanded(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: CalendarDatePicker(
                  initialDate: _selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                  onDateChanged: _onDateChanged,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Dec 15, Wednesday'),
                      subtitle: Text('9:00 AM - 10:00 AM'),
                    ),
                    ListTile(
                      title: Text('Dec 16, Thursday'),
                      subtitle: Text('11:00 AM - 12:00 PM'),
                    ),
                    ListTile(
                      title: Text('Dec 17, Friday'),
                      subtitle: Text('3:00 PM - 4:00 PM'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(6.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle confirmation action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Updated to backgroundColor
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Center(
                    child: Text('Confirm'),
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

// New WeatherScreen class
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
            TextField(
              decoration: InputDecoration(
                labelText: 'Search City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '7-Day Forecast',
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
            // Forecast details
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Monday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Tuesday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Wednesday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Thursday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Friday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Saturday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                  ListTile(
                    title: Text('Sunday'),
                    subtitle: Text('13°C - 23°C'),
                    trailing: Text('UV Index: 6'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New MarketPriceScreen class
class MarketPriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
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
              'Current Fruit Prices',
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
            // Fruit prices
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Apples'),
                    trailing: Text('\$3.00/kg'),
                  ),
                  ListTile(
                    title: Text('Bananas'),
                    trailing: Text('\$2.50/kg'),
                  ),
                  ListTile(
                    title: Text('Oranges'),
                    trailing: Text('\$4.00/kg'),
                  ),
                  ListTile(
                    title: Text('Strawberries'),
                    trailing: Text('\$5.00/kg'),
                  ),
                  ListTile(
                    title: Text('Blueberries'),
                    trailing: Text('\$6.00/kg'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New CropProductionTechniquesScreen class
class CropProductionTechniquesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Production Techniques'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text(
              'Soil Management',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 28 / 22,
                fontFeatures: [FontFeature.enable('dlig')],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Soil management is the foundation to successful farming. It involves maintaining proper soil structure, and managing nutrients and pH levels',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Water Management',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 28 / 22,
                fontFeatures: [FontFeature.enable('dlig')],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Proper water mangament can make a huge difference in crop production. This includes irrigation scheduling and water conservation.',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Sowing Rate',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 28 / 22,
                fontFeatures: [FontFeature.enable('dlig')],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The sowing rate is the number of planted seed per acre. The optimum rate varies by crop species, variety, and environmental conditions.',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pesticide Management',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
                height: 28 / 22,
                fontFeatures: [FontFeature.enable('dlig')],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Pesticides are used to reduce crop damage from pests. Proper pesticide management includes selecting the right type and using the right time',
              style: TextStyle(
                color: Color(0xFF141C0D),
                fontFamily: 'Manrope',
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
