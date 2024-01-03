import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemberManagementScreen extends StatelessWidget {
  const MemberManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Management'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('members').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No members found.'));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var member = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(member['name']),
                  subtitle: Text(
                      'ID: ${member['id']}, Ward: ${member['ward']}, Email: ${member['email']}'),
                  onTap: () {
                    // Navigate to member details screen or edit member screen
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
