import 'package:flutter/material.dart';
import 'package:agri_guide_app/auth_service.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _checkLoginStatus(context);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  void _checkLoginStatus(BuildContext context) async {
    final authService =
        AuthService(); // Create an instance of the AuthService class
    final isLoggedIn = await authService.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }
}
