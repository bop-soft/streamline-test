import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/services/calendar_permission_service.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/components/streamline_outlined_button.dart';
import 'package:streamline/views/components/streamline_snackbar.dart';
import 'package:streamline/views/screens/manage_appointments_screen.dart';

class BookingSuccessfulScreen extends StatefulWidget {
  const BookingSuccessfulScreen({super.key});

  @override
  State<BookingSuccessfulScreen> createState() => _BookingSuccessfulScreenState();
}

class _BookingSuccessfulScreenState extends State<BookingSuccessfulScreen> {

_onContinuing(){
  Navigator.of(context).pushReplacement(MaterialPageRoute
  (builder: (context) => const ManageAppointmentsScreen()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding:  EdgeInsets.all(defaultPaddingSize),
        width: double.infinity,
        height: 180,
        child: Column(
          children: [
            StreamlineOutlinedButton.build(context, "Add to Calendar",
            onPressed: () async {
            final status = await CalendarPermissionService.request();
            if (status) {
              if (!context.mounted) return;
              StreamlineSnackbar.build(context, "Device calendar added!");
            }
            }),
            const SizedBox(height: 10),
            StreamlineElevatedButton.build(context, "Manage appointments",
            onPressed: _onContinuing
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outlined, size: 100, color: Colors.green),
            const SizedBox(height: 32),
            Text("Booking Successful!",
            style: TextStyle(
              fontSize: extraHeaderSize,
            ),),
          ],
        ),
      ),
    );
  }
}