import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gitbit/screens/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: EmailPasswordSignInPage()));
}

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
  static const Color tealGreen = Color(0xFF005B41);
}

class EmailPasswordSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: EmailPasswordSignInForm(),
        ),
      ),
    );
  }
}

class EmailPasswordSignInForm extends StatefulWidget {
  @override
  _EmailPasswordSignInFormState createState() => _EmailPasswordSignInFormState();
}

class _EmailPasswordSignInFormState extends State<EmailPasswordSignInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Email & Password Sign In",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildTextField(emailController, 'Email', Icons.email),
              buildTextField(passwordController, 'Password', Icons.lock),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    if (userCredential.user != null) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Homescreen()));
                    } else {
                      // Handle authentication failure
                    }
                  } catch (e) {
                    // Handle exceptions
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.navyBlue),
                ),
                child: Text('Sign In', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String hintText, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: MyColors.tealGreen),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}