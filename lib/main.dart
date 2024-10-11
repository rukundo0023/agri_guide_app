import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyBCNGXnWPPuAFFZu0TfSXoMpu928olFBnY",
        appId: "1:161171749060:android:b11a59eaeaa3b660e5b191",
        messagingSenderId: "161171749060",
        projectId: "agriguide-4e8fe",
        // Your web Firebase config options
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

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
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/profile': (context) => ProfileScreen(),
        '/notifications': (context) => NotificationScreen(),
        '/weather': (context) => WeatherScreen(),
        '/marketprices': (context) => MarketPricesScreen(),
        '/cropproduction': (context) => CropProductionTechniquesScreen(),
        '/booking': (context) =>
            ConsultationBookingPage(customGreen: Colors.green),
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
            icon: Image.asset(
              'assets/images/home_icon.png', // Path to your local image
              width: 20,
              height: 20,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/booking_icon.png',
              width: 20,
              height: 20,
            ),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile_icon.png',
              width: 20,
              height: 20,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/notification_icon.png',
              width: 20,
              height: 20,
            ),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/weather_icon.png',
                width: 20, height: 20),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/marketprice_icon.png',
                width: 20, height: 20),
            label: 'Market Price',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/cropproduction_icon.png',
                width: 20, height: 20),
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
              Navigator.pushNamed(context, '/booking');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
            case 3:
              Navigator.pushNamed(context, '/notifications');
              break;
            case 4:
              Navigator.pushNamed(context, '/weather');
              break;
            case 5:
              Navigator.pushNamed(context, '/marketprices');
              break;
            case 6:
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureText = true;

  void _register() async {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    try {
      final newUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (newUser.user != null) {
        Navigator.popUntil(context, ModalRoute.withName('/login'));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                fillColor:
                    Colors.green[100], // Background color of the text field
                filled: true, // Enable background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Password',
                fillColor:
                    Colors.green[100], // Background color of the text field
                filled: true, // Enable background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                fillColor:
                    Colors.green[100], // Background color of the text field
                filled: true, // Enable background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Background color of the button
              ),
              child: Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

// New NotificationScreen class
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Check if login is successful
      if (userCredential.user != null) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      // Handle specific errors
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-email') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Invalid email format. Please check your email address.')),
          );
          Navigator.pushNamed(context,
              '/register'); // Redirect to register screen if email is invalid
        } else if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Incorrect email or password. Please try again.')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to login. Please try again.')),
          );
        }
      } else {
        // Handle other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('An unexpected error occurred. Please try again.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  fillColor:
                      Colors.green[100], // Background color of the text field
                  filled: true, // Enable background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Password',
                  fillColor:
                      Colors.green[100], // Background color of the text field
                  filled: true, // Enable background color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.green, width: 2.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.green,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // Background color of the button
                ),
                child: Text('Login', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text('Don\'t have an account? Register',
                    style: TextStyle(color: Colors.green)),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/forgot_password');
                },
                child: Text('Forgot Password?',
                    style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  final Color customGreen;

  ConsultationBookingPage({required this.customGreen});

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
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CalendarDatePicker(
              initialDate: _selectedDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100),
              onDateChanged: _onDateChanged,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Show a SnackBar with a success message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Successfully Booked'),
                    backgroundColor:
                        Colors.green, // Customize the SnackBar color if needed
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.customGreen, // Custom button color
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
    );
  }
}

// New WeatherScreen class
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

// New MarketPriceScreen class
class MarketPricesScreen extends StatefulWidget {
  @override
  _MarketPricesScreenState createState() => _MarketPricesScreenState();
}

class _MarketPricesScreenState extends State<MarketPricesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Sample data for fruits and their prices
  final List<Map<String, String>> _marketPrices = [
    {'fruit': 'Avocado', 'price': '\$2.50 per piece'},
    {'fruit': 'Banana', 'price': '\$1.20 per bunch'},
    {'fruit': 'Strawberry', 'price': '\$3.00 per pint'},
    {'fruit': 'Mango', 'price': '\$1.80 per piece'},
    {'fruit': 'Pineapple', 'price': '\$4.00 per piece'},
    {'fruit': 'Apple', 'price': '\$1.50 per piece'},
    {'fruit': 'Orange', 'price': '\$2.00 per dozen'},
    {'fruit': 'Blueberry', 'price': '\$5.00 per pint'},
    {'fruit': 'Grapes', 'price': '\$2.20 per pound'},
    {'fruit': 'Peach', 'price': '\$3.50 per piece'},
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
    final filteredMarketPrices = _marketPrices
        .where((item) => item['fruit']!.toLowerCase().contains(_searchQuery))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Market Prices'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Optionally, you can show a search bar in the app bar or navigate to another screen for search
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for fruits',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: filteredMarketPrices.length,
                itemBuilder: (context, index) {
                  final item = filteredMarketPrices[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        item['fruit']!,
                        style: TextStyle(
                          color: Color(0xFF141C0D),
                          fontFamily: 'Manrope',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        item['price']!,
                        style: TextStyle(
                          color: Color(0xFF141C0D),
                          fontFamily: 'Manrope',
                          fontSize: 16,
                        ),
                      ),
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

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with your image asset
              backgroundColor: Colors.grey[200],
            ),
            SizedBox(height: 16),
            // User Name
            Text(
              'Rukundo Guled',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            // User Email
            Text(
              'Rukundoguled@gmail.com',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            // User Bio
            Text(
              'A passionate developer with a love for technology and innovation. Always eager to learn and grow.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            // User Location
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  'San Francisco, CA',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            // Social Media Links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.link, color: Colors.blueAccent),
                  onPressed: () {
                    _launchLinkedIn(); // Implement LinkedIn profile opening
                  },
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: Colors.blueAccent),
                  onPressed: () {
                    _launchInstagram(); // Implement Instagram profile opening
                  },
                ),
                SizedBox(width: 16),
                IconButton(
                  icon: Icon(Icons.email, color: Colors.blueAccent),
                  onPressed: () {
                    _launchTwitter(); // Implement Twitter profile opening
                  },
                ),
              ],
            ),
            Spacer(), // Takes up remaining space and pushes footer buttons to the bottom
            // Action Buttons
            ElevatedButton(
              onPressed: () {
                _editProfile(context); // Immediate edit profile action
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _performLogout(context); // Implement logout action
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Logout button color
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            // Change Password Button
            ElevatedButton(
              onPressed: () {
                _changePassword(context); // Immediate change password action
              },
              child: Text('Change Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchLinkedIn() {
    // Add logic to open LinkedIn profile
  }

  void _launchInstagram() {
    // Add logic to open Instagram profile
  }

  void _launchTwitter() {
    // Add logic to open Twitter profile
  }

  void _performLogout(BuildContext context) {
    // Add logout logic here, such as clearing user session and navigating to login screen
    Navigator.pushReplacementNamed(
        context, '/login'); // Replace with your login route
  }

  void _editProfile(BuildContext context) {
    // Edit Profile Dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _nameController = TextEditingController();
        final _emailController = TextEditingController();
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                // Handle save logic here

                // Use 'name' and 'email' here for actual profile update logic
                // For example:
                // updateProfile(name, email);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _changePassword(BuildContext context) {
    // Change Password Dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _oldPasswordController = TextEditingController();
        final _newPasswordController = TextEditingController();
        final _confirmPasswordController = TextEditingController();
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _oldPasswordController,
                decoration: InputDecoration(labelText: 'Old Password'),
                obscureText: true,
              ),
              TextField(
                controller: _newPasswordController,
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm New Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Change'),
              onPressed: () {
                // Handle change password logic here

                // Validate passwords and perform password change
                // For example:
                // if (newPassword == confirmPassword) {
                //   changePassword(oldPassword, newPassword);
                // } else {
                //   showError('Passwords do not match');
                // }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(
                context: context,
                title: 'Soil Management',
                description:
                    'Soil management is the foundation of successful farming. It involves maintaining proper soil structure and managing nutrients and pH levels.',
                icon: Icons.nature,
              ),
              _buildSection(
                context: context,
                title: 'Water Management',
                description:
                    'Proper water management significantly impacts crop production. This includes irrigation scheduling and water conservation techniques.',
                icon: Icons.water,
              ),
              _buildSection(
                context: context,
                title: 'Sowing Rate',
                description:
                    'The sowing rate refers to the number of seeds planted per acre. The optimal rate varies by crop species, variety, and environmental conditions.',
                icon: Icons.crop_square,
              ),
              _buildSection(
                context: context,
                title: 'Pesticide Management',
                description:
                    'Pesticides help reduce crop damage from pests. Effective pesticide management involves selecting the right type and applying it at the appropriate time.',
                icon: Icons.pest_control,
              ),
              _buildSection(
                context: context,
                title: 'Crop Rotation',
                description:
                    'Crop rotation involves alternating crops in a specific sequence to improve soil health, manage pests, and optimize nutrient use.',
                icon: Icons.rotate_left,
              ),
              _buildSection(
                context: context,
                title: 'Fertilization',
                description:
                    'Fertilization is the application of nutrients to enhance crop growth. It includes understanding the types of fertilizers and their correct application methods.',
                icon: Icons.grain,
              ),
              _buildSection(
                context: context,
                title: 'Harvesting Techniques',
                description:
                    'Harvesting techniques ensure the proper timing and method for collecting crops to maximize yield and quality.',
                icon: Icons.agriculture,
              ),
              _buildSection(
                context: context,
                title: 'Pest Management',
                description:
                    'Effective pest management strategies help in controlling pests and diseases that can harm crops. Integrated pest management (IPM) is often used.',
                icon: Icons.bug_report,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 32,
            color: Color(0xFF141C0D),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF141C0D),
                    fontFamily: 'Manrope',
                    fontSize: 22,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    height: 28 / 22,
                    fontFeatures: [FontFeature.enable('dlig')],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
