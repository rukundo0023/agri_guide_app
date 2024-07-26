import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import the flutter_svg package

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
