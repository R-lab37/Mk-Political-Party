import 'package:flutter/material.dart';
import 'package:mk/dashboard_screen.dart';
import 'package:mk/member_management_screen.dart';
import 'package:mk/messaging_screen.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()));
                // Navigate to Dashboard
              },
            ),
            ListTile(
              title: Text('Member Management'),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MemberManagementScreen()));
                // Navigate to Member Management
              },
            ),
            ListTile(
              title: Text('Messaging'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MessagingScreen()));
                // Navigate to Messaging
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Admin!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Manage and oversee the membership registration system for the political party "MK" efficiently with the Admin Dashboard.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminDashboard()),
                );
              },
              child: GestureDetector(
                child: Text('Go to Admin Dashboard'),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
