import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/components/streamline_outlined_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context),
      bottomNavigationBar: Container(
        padding:  EdgeInsets.all(defaultPaddingSize),
        width: double.infinity,
        height: 180,
        child: Column(
          children: [
            StreamlineOutlinedButton.build(context, "Manage appointments"),
            const SizedBox(height: 10),
            StreamlineElevatedButton.build(context, "Book an appointment"),
          ],
        ),
      ),
      body: Column(children: [
        Padding(
          padding:  EdgeInsets.all(defaultPaddingSize),
          child: Center(
            child: Text("Welcome to Streamline!", 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: extraHeaderSize,
              fontWeight: FontWeight.w700,
              color: primaryColor,
              letterSpacing: 1.5
            ),),
          ),
        ),
        Image.asset("assets/welcome.png"),
      ],),
    );
  }
}