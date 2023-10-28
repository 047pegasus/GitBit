import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gitbit/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
      theme: ThemeData(
        primaryColor: MyColors.navyBlue,
        hintColor: MyColors.tealGreen,
        scaffoldBackgroundColor: MyColors.darkGrey,
      ),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final List<String> welcomeTexts = [
    'Welcome to GitBit',
    'Leaderboard',
    'Use Our Tools',
  ];

  int _currentSlideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              welcomeTexts[_currentSlideIndex],
              style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 300,
              child: CarouselSlider(
                items: [
                  _buildSlide('assets/xwirnzarW3.json', 'Text 1'),
                  _buildSlide('assets/ULflzJpeCU.json', 'Text 2'),
                  _buildSlide('assets/kpEG3IE5gY.json', 'Text 3'),
                ],
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentSlideIndex = index;
                    });
                  },
                  autoPlay: true, // Enable auto-play
                  autoPlayInterval: Duration(seconds: 3), // Auto-play interval
                  autoPlayAnimationDuration: Duration(milliseconds: 800), // Animation duration
                  autoPlayCurve: Curves.fastOutSlowIn, // Animation curve
                ),
              ),
            ),
            SizedBox(height: 20.0),
            AnimatedGoButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => UsernameInputScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlide(String animationAsset, String text) {
    return Lottie.asset(animationAsset);
  }
}

class AnimatedGoButton extends StatelessWidget {
  final VoidCallback onPressed;

  AnimatedGoButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.teal,
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: MyColors.tealGreen,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Go',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
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
