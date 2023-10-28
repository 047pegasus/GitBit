import 'package:flutter/material.dart';



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
              style: TextStyle(
                color: MyColors.navyBlue,
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
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [MyColors.navyBlue, MyColors.tealGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            color: Colors.white,
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
}
