import 'package:flutter/material.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context, title: "My Appointments"),
      
    );
  }
}