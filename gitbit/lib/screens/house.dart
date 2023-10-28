import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  final String username;
  final Map<String, dynamic> userData;

  Dashboard(this.username, this.userData);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    // Check and update the login status in SharedPreferences when the Dashboard is initialized.
    checkAndUpdateLoginStatus();
  }

  // Function to check and update the login status using SharedPreferences.
  void checkAndUpdateLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    // You can perform any additional actions based on the login status.
    if (!isLoggedIn) {
      // If the user is not logged in, you can navigate to the login screen.
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.userData['avatar_url']),
                radius: 60,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'WELCOME: ${widget.username}',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildInfoTile("Name", widget.userData['name'] ?? 'N/A', Icons.person),
            buildInfoTile(
                "Location", widget.userData['location'] ?? 'N/A', Icons.location_on),
            buildInfoTile("Bio", widget.userData['bio'] ?? 'N/A', Icons.info),
            buildInfoTile(
                "Followers", "${widget.userData['followers'] ?? 0}", Icons.people),
            buildInfoTile(
                "Following", "${widget.userData['following'] ?? 0}", Icons.people),
            buildInfoTile("Public Repositories",
                "${widget.userData['public_repos'] ?? 0}", Icons.folder),
            buildInfoTile("Website", widget.userData['blog'] ?? 'N/A', Icons.web),
            ElevatedButton(
              onPressed: () {
                _logout(context);
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false); // Mark the user as logged out.
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/login', // Replace with your login route
      (route) => false,
    );
  }

  Widget buildInfoTile(String title, String value, IconData icon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedContainer(
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            value,
            style: GoogleFonts.montserrat(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ElevatedContainer extends StatefulWidget {
  final Widget child;

  ElevatedContainer({required this.child});

  @override
  _ElevatedContainerState createState() => _ElevatedContainerState();
}

class _ElevatedContainerState extends State<ElevatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // You can adjust the duration
    );
    _colorAnimation = ColorTween(
      begin: MyColors.navyBlue,
      end: MyColors.tealGreen,
    ).animate(_controller);

    // Start the animation and make it loop continuously
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [_colorAnimation.value!, _colorAnimation.value!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
  static const Color tealGreen = Color(0xFF005B41);
}
