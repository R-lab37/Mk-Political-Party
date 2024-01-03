import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Members: 100', // Replace with actual total members count
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Ward Breakdown:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                        'Ward 1: 30'), // Replace with actual member count for Ward 1
                  ],
                ),
                Column(
                  children: [
                    Text(
                        'Ward 2: 40'), // Replace with actual member count for Ward 2
                  ],
                ),
                Column(
                  children: [
                    Text(
                        'Ward 3: 30'), // Replace with actual member count for Ward 3
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
