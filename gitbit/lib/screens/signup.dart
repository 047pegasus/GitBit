import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gitbit/model.dart/alert.dart';
import 'package:gitbit/model.dart/page.dart';
import 'package:gitbit/screens/navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Future<void> googleButton() async {
    Dialogs.showCustomProgressbar(context);

    await signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => MyUserDetailsPage()),
        );
      }
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      await InternetAddress.lookup("google.com");

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Gitbit',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            buildElevatedButtonWithIcon(
              onPressed: googleButton,
              icon:
                  Image.asset('assets/google_logo.png', width: 30, height: 30),
              label: 'Sign In with Google',
            ),
            SizedBox(height: 20.0),
            buildElevatedButtonWithIcon(
             onPressed: () {
          },
              icon:
                  Image.asset('assets/github_logo.png', width: 40, height: 40),
              label: 'Sign In with GitHub',
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Homescreen()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.tealGreen,
              ),
            )
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
