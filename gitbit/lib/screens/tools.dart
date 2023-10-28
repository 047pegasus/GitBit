import 'package:flutter/material.dart';

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
}

class Tools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Image.asset(
                      'assets/gsoc.png', // Replace with your image path
                      width: 30, // Set the desired width
                    ),
                    label: Text('GSOC'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Image.asset(
                      'assets/man.png', // Replace with your image path
                      width: 30, // Set the desired width
                    ),
                    label: Text('FOREST FARMER'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Image.asset(
                      'assets/notes.png', // Replace with your image path
                      width: 30, // Set the desired width
                    ),
                    label: Text('RESOURCES'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Image.asset(
                      'assets/snake.png', // Replace with your image path
                      width: 30,
                      height: 50, // Set the desired width
                    ),
                    label: Text('SNAKE'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your action here
                    },
                    icon: Image.asset(
                      'assets/git.png', // Replace with your image path
                      width: 30, // Set the desired width
                    ),
                    label: Text('GIT '),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
