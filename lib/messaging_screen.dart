import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  String? _recipientType;
  List<String> _recipients = [];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    // Implement logic to send message to selected recipients
    print('Message sent to $_recipientType: ${_recipients.join(', ')}');
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _recipientType,
              hint: Text('Select Recipient Type'),
              items: ['Individual', 'Ward', 'All Members'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _recipientType = newValue;
                  _recipients.clear();
                });
              },
            ),
            SizedBox(height: 16),
            _recipientType != null
                ? TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 5,
                  )
                : SizedBox.shrink(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}
