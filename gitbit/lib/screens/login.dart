import 'package:flutter/material.dart';
import 'package:gitbit/screens/navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UsernameInputScreen extends StatefulWidget {
  @override
  _UsernameInputScreenState createState() => _UsernameInputScreenState();
}

class _UsernameInputScreenState extends State<UsernameInputScreen> {
  TextEditingController usernameController = TextEditingController();

  void navigateToDashboard(String username) async {
    final userData = await fetchUserData(username);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Homescreen(username, userData),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchUserData(String username) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Enter GitHub Username',
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = usernameController.text;
                navigateToDashboard(username);
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
  static const Color tealGreen = Color(0xFF005B41);
  static const Color darkCyan = Color(0xFF008170);
}
