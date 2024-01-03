import 'package:flutter/material.dart';
import 'package:mk/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyCVHBLxK1icbPW3idqBpG7rYEM9nVQM9P0",
    projectId: "mk-political-party",
    messagingSenderId: "926414141489",
    appId: "1:926414141489:web:4f92d94919f3806b787d10",
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Political Party App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
