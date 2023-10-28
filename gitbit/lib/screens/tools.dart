import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
  static const Color navyBlue = Color(0xFF232D3F);
}

class Tools extends StatefulWidget {
  const Tools({Key? key});

  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'GitHub Tools 🛠️',
              style: GoogleFonts.montserrat(
                fontSize: 36,
            
                color: Colors.white,
              ),
            ),
            SizedBox(height: 30.0),
            buildElevatedButtonWithIcon(
              onPressed: () {},
              icon: Image.asset('assets/gsoc.png', width: 30, height: 30),
              label: 'GSOC',
            ),
            SizedBox(height: 10.0),
            buildElevatedButtonWithIcon(
              onPressed: () {},
              icon: Image.asset('assets/man.png', width: 30, height: 30),
              label: 'Forest Farmer',
            ),
            SizedBox(height: 10.0),
            buildElevatedButtonWithIcon(
              onPressed: () {},
              icon: Image.asset('assets/notes.png', width: 30, height: 30),
              label: 'Resources',
            ),
            SizedBox(height: 10.0),
            buildElevatedButtonWithIcon(
              onPressed: () {},
              icon: Image.asset('assets/snake.png', width: 30, height: 30),
              label: 'Snake',
            ),
            SizedBox(height: 10.0),
            buildElevatedButtonWithIcon(
              onPressed: () {},
              icon: Image.asset('assets/git.png', width: 30, height: 30),
              label: 'Git',
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tools(),
      theme: ThemeData(
        primaryColor: MyColors.navyBlue,
        scaffoldBackgroundColor: MyColors.darkGrey,
      ),
    );
  }
}
