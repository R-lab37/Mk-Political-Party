import 'package:flutter/material.dart';
import 'package:mk/admin_dashboard.dart';
import 'package:mk/registration_form.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MK Party'),
        actions: [
          IconButton(
            icon: Icon(Icons.dashboard), // Use icon for Admin Dashboard
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminDashboard()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimatedTextKit(
              repeatForever: true,
              text: ['Register Now', 'Become a Member', 'Join Us Today'],
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              duration: Duration(seconds: 2),
              onTap: () {
                // Navigate to registration form or desired screen
              },
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationForm()),
                );
                // Navigate to registration form or desired screen
              },
              icon: Icon(Icons.add),
              label: Text('Register Now'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
