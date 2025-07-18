import 'package:flutter/material.dart';
import 'package:streamline/views/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.green,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
      home: MainScreen(
      ),
    );
  }
}
