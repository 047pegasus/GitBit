import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gitbit/screens/navigation.dart';
import 'package:gitbit/screens/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: ButtonPage(),
  ));
}

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  void initState() {
    super.initState();
    checkUserAuthentication();
  }

  void checkUserAuthentication() async {
    final prefs = await SharedPreferences.getInstance();
    final userUid = prefs.getString('userUid');
    if (userUid != null) {
      // User is already authenticated, navigate to the home screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homescreen()));
    }
  }

  void googleButton() {
    Dialogs.showCustomProgressbar(context);

    signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        // Save the user's UID to SharedPreferences
           saveUserUid(user.user!.uid);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Homescreen()),
        );
      } else {
        // User sign-in failed
        // Show an error message or take appropriate action
        Dialogs.showSnackbar(context, "Sign-in failed");
      }
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      Dialogs.showSnackbar(context, "No Internet Connection");
      return null;
    }
  }

  void saveUserUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userUid', uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome to Gitbit',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            buildElevatedButtonWithIcon(
              onPressed: googleButton,
              icon: Image.asset('assets/google_logo.png', width: 30, height: 30),
              label: 'Sign In with Google',
            ),
            SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Signup()),
                );
              },
              child: Text(
                'New User? Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButtonWithIcon({
    required void Function() onPressed,
    required Widget icon,
    required String label,
  }) {
    return SizedBox(
      width: 300.0,
      height: 100,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
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

class Dialogs {
  static void showCustomProgressbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

