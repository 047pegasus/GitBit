import 'package:flutter/material.dart';
import 'package:gitbit/screens/login2.dart';
import 'package:gitbit/screens/navigation.dart';
import 'package:gitbit/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MaterialApp(
    home: isLoggedIn ? Homescreen('initialUsername', {}) : Welcome(),
    routes: {
      '/login': (context) => SignInPage(),
      '/home': (context) => Homescreen('initialUsername', {}), // Change 'initialUsername' to the actual username
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Welcome(),
      routes: {
        '/login': (context) => SignInPage(),
        '/home': (context) => Homescreen('initialUsername', {}), // Change 'initialUsername' to the actual username
      },
    );
  }
}
