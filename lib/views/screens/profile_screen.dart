import 'package:flutter/material.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/screens/main_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context, title: "My Profile",
      actions: [
        IconButton(onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute
          (builder: (context) => MainScreen(),));
        }, icon: Icon(Icons.logout))
      ]
      ),
    );
  }
}