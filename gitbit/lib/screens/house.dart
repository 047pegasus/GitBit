import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  final String username;
  final Map<String, dynamic> userData;

  Dashboard(this.username, this.userData);

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
                backgroundImage: NetworkImage(userData['avatar_url']),
                radius: 60,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'WELCOME: $username',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            buildInfoTile("Name", userData['name'] ?? 'N/A', Icons.person),
            buildInfoTile(
                "Location", userData['location'] ?? 'N/A', Icons.location_on),
            buildInfoTile("Bio", userData['bio'] ?? 'N/A', Icons.info),
            buildInfoTile(
                "Followers", "${userData['followers'] ?? 0}", Icons.people),
            buildInfoTile(
                "Following", "${userData['following'] ?? 0}", Icons.people),
            buildInfoTile("Public Repositories",
                "${userData['public_repos'] ?? 0}", Icons.folder),
            buildInfoTile("Website", userData['blog'] ?? 'N/A', Icons.web),
          ],
        ),
      ),
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
