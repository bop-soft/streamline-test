import 'package:flutter/material.dart';
import 'package:streamline/views/screens/home_screen.dart';
import 'package:streamline/views/screens/profile_screen.dart';

class ManageAppointmentsScreen extends StatefulWidget {
  const ManageAppointmentsScreen({super.key});

  @override
  State<ManageAppointmentsScreen> createState() => _ManageAppointmentsScreenState();
}

class _ManageAppointmentsScreenState extends State<ManageAppointmentsScreen> {
  

  int _currentPage = 0;

  final List _pages = [
   HomeScreen(),
  ProfileScreen(),
  ];

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,

        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), label: "Profile"),
      ]),
      body: _pages[_currentPage],
    );
  }
}