import 'package:flutter/material.dart';
import 'package:gitbit/screens/navigation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MaterialApp(
    home:
        isLoggedIn ? Homescreen('initialUsername', {}) : UsernameInputScreen(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsernameInputScreen(),
    );
  }
}

class UsernameInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your GitHub username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                color: MyColors.darkGrey,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: UsernameInputForm(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UsernameInputForm extends StatefulWidget {
  @override
  _UsernameInputFormState createState() => _UsernameInputFormState();
}

class _UsernameInputFormState extends State<UsernameInputForm> {
  TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void navigateToDashboard(String username) async {
    final userData = await fetchUserData(username);

    // Set login status to true
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Homescreen(username, userData),
      ),
      (route) => false,
    );
  }

  Future<Map<String, dynamic>> fetchUserData(String username) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      showSnackBar('Failed to load user data', isError: true);
      throw Exception('Failed to load user data');
    }
  }

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: isError ? Colors.red : Colors.white,
          ),
        ),
        backgroundColor: isError ? Colors.black : MyColors.tealGreen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'GitHub Username',
              labelStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.tealGreen),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.tealGreen),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a username';
              }
              return null;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                String username = usernameController.text;
                navigateToDashboard(username);
              }
            },
            child: Text('Search'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(MyColors.tealGreen),
            ),
          ),
        ],
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