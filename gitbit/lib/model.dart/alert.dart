import 'package:flutter/material.dart';
import 'package:gitbit/model.dart/page.dart';

class Dialogs {
  static void showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: MyColors.tealGreen,
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void showCustomProgressbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Center(
        child: Container(
          width: 100, // Adjust the size as needed
          height: 4,   // Adjust the size as needed
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey,  // Background color
            valueColor: AlwaysStoppedAnimation(MyColors.tealGreen), // Indicator color
          ),
        ),
      ),
    );
  }
}
