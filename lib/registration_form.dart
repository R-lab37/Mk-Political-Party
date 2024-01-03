import 'package:flutter/material.dart';
import 'package:mk/registration_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String id = '';
  String address = '';
  String ward = '';
  String? email;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _saveMemberData(name, id, address, ward, email);
    }
  }

  void _saveMemberData(
      String name, String id, String address, String ward, String? email) {
    final CollectionReference members =
        FirebaseFirestore.instance.collection('members');

    members
        .add({
          'name': name,
          'id': id,
          'address': address,
          'ward': ward,
          'email': email ?? '',
        })
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => RegistrationScreen(),
              ),
            ))
        .catchError((error) => print('Failed to store member data: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter name' : null,
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ID'),
                validator: (value) => value!.isEmpty ? 'Please enter ID' : null,
                onSaved: (value) => id = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Physical Address'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter address' : null,
                onSaved: (value) => address = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Ward Number'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter ward number' : null,
                onSaved: (value) => ward = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email (Optional)'),
                onSaved: (value) => email = value!.isEmpty ? null : value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
