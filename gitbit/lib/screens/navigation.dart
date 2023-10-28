import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gitbit/screens/house.dart';
import 'package:gitbit/screens/leaderboard.dart';
import 'package:gitbit/screens/tools.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

class Homescreen extends StatefulWidget {
  final String username;
  final Map<String, dynamic> userData;

  Homescreen(this.username, this.userData);

  @override
  _HomescreenState createState() => _HomescreenState(username, userData);
}

class _HomescreenState extends State<Homescreen> {
  final String username;
  final Map<String, dynamic> userData;

  _HomescreenState(this.username, this.userData);

  int _selectedIndex = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      Dashboard(username, userData), // Pass the username and userData here
      const Leaderboard(),
      Tools(),
    ];
  }

  ScreenshotController screenshotController = ScreenshotController();

  void shareScreenshot() async {
    try {
      final screenshot = await screenshotController.capture();
      if (screenshot != null) {
        Share.shareFiles([screenshot], text: 'Check out my GitBit screenshot!');
      }
    } catch (e) {
      print('Error sharing screenshot: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: MyColors.tealGreen,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.leaderboard, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.share, size: 30), // Add a share button
        ],
        onTap: (index) {
          if (index == 3) {
            // Share button tapped
            shareScreenshot();
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
      body: Screenshot(
        controller: screenshotController,
        child: _pages[_selectedIndex],
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
