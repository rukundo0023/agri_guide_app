import 'package:flutter/material.dart';

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
              'Rukundoguled@example.com',
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
