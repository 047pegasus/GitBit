import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
  static const Color tealGreen = Color(0xFF005B41);
}

class MyUserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyUserDetailsForm(),
        ),
      ),
    );
  }
}

class MyUserDetailsForm extends StatefulWidget {
  @override
  _MyUserDetailsFormState createState() => _MyUserDetailsFormState();
}

class _MyUserDetailsFormState extends State<MyUserDetailsForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController githubIdController = TextEditingController();
  final TextEditingController interestsController = TextEditingController();
  final TextEditingController languagesController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();

  // List of available interest options
  final List<String> availableInterests = [
    'Technology',
    'Sports',
    'Art',
    'Music',
    'Cooking',
    'Travel',
    'Photography',
    'Gaming',
    'Fashion',
    'Books',
    'Fitness',
    'Movies',
    'Science',
    'Nature',
    'Food',
  ];

  // List of available programming languages
  final List<String> availableLanguages = [
    'JavaScript',
    'Python',
    'Java',
    'C++',
    'Swift',
    'Ruby',
    'Go',
    'Kotlin',
    'Dart',
    'PHP',
    'C#',
    'Rust',
  ];

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
                "User Details",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildTextField(nameController, 'Name', Icons.person),
              buildTextField(emailController, 'Email', Icons.email),
              buildTextField(githubIdController, 'GitHub ID', Icons.code),
              buildTextField(interestsController, 'Interests', Icons.star),
              buildInterestOptions(availableInterests, interestsController),
              buildTextField(languagesController, 'Languages', Icons.language),
              buildInterestOptions(availableLanguages, languagesController),
              buildTextField(ageController, 'Age', Icons.cake),
              buildTextField(linkedinController, 'LinkedIn', Icons.link),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final githubId = githubIdController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Dashboard(githubId),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(MyColors.navyBlue),
                ),
                child: Text('Save', style: TextStyle(color: Colors.white)),
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

  Widget buildInterestOptions(List<String> options, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        spacing: 8.0,
        children: options.map((option) {
          return GestureDetector(
            onTap: () {
              controller.text = option;
            },
            child: Chip(
              label: Text(option),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  final String githubId;

  Dashboard(this.githubId);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/${widget.githubId}'));

    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      appBar: AppBar(
        title: Text("GitHub Profile"),
        backgroundColor: MyColors.navyBlue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(userData['avatar_url'] ?? ''),
                  radius: 60,
                ),
              ),
              SizedBox(height: 20),
              buildInfoTile("Name", userData['name'] ?? 'N/A', Icons.person),
              buildInfoTile("Location", userData['location'] ?? 'N/A', Icons.location_on),
              buildInfoTile("Bio", userData['bio'] ?? 'N/A', Icons.info),
              buildInfoTile("Followers", "${userData['followers'] ?? 0}", Icons.people),
              buildInfoTile("Following", "${userData['following'] ?? 0}", Icons.people),
              buildInfoTile("Public Repositories", "${userData['public_repos'] ?? 0}", Icons.folder),
              buildInfoTile("Public Gists", "${userData['public_gists'] ?? 0}", Icons.code),
              buildInfoTile("Website", userData['blog'] ?? 'N/A', Icons.web),
            ],
          ),
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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
