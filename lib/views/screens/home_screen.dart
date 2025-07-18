import 'package:flutter/material.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/screens/patient_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _appointments = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context, title: "My Appointments",
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined))
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        label: Text("Add Appointment", 
        style: TextStyle(color: Colors.white),),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute
          (builder: (context) => PatientDetailsScreen(),));
        }),
      body: _appointments.isEmpty ? 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.calendar_month_outlined, size: 100, color: Colors.green),
            const SizedBox(height: 32),
            Text("No appointments found!",
            style: TextStyle(fontSize: 18.0),),
          ],
        ),
      )
      :  ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (context, index) {
          final appointment = _appointments[index];
        return ListTile(
          title: Text(appointment["title"]),
          subtitle: Text(appointment["date"]),
          trailing: Text(appointment["time"]),
        );
      },),
    );
  }
}