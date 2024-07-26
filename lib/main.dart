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
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'assets/new_image.png',
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
