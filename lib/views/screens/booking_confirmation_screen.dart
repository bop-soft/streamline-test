import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/screens/booking_successful_screen.dart';

class BookingConfirmationScreen extends StatefulWidget {
  const BookingConfirmationScreen({super.key});

  @override
  State<BookingConfirmationScreen> createState() => _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {

  _onContinuing(){
    Navigator.of(context).pushReplacement(MaterialPageRoute
    (builder: (context) => const BookingSuccessfulScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context, automaticallyImplyLeading: true),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(defaultPaddingSize),
        child: Container(
          child: StreamlineElevatedButton.build(context, "Confirm",
          onPressed: _onContinuing,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(defaultPaddingSize),
        child: Column(
          children: [
                             Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Review booking",
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                    Text("4/4", 
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      color: Colors.green,
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                   ],
                 ),
                const SizedBox(height: 32), 
                ListTile(
                  title: Text("Mukasa Abed"),
                  subtitle: Text("mukasa@mukasa.com"),
                  trailing: Icon(Icons.check_circle_outlined),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text("MA",
                    style: TextStyle(color: Colors.white),),
                  ),
                ),
                ListTile(
                  title: Text("Date"),
                  trailing: Text("2/8/2025", style: 
                  TextStyle(
                    fontSize: defaultPaddingSize
                  ),),
                  leading: Icon(Icons.calendar_month_outlined),
                ),
                ListTile(
                  title: Text("Time"),
                  trailing: Text("9:00 AM", style: 
                  TextStyle(
                    fontSize: defaultPaddingSize
                  ),),
                  leading: Icon(Icons.alarm_outlined),
                ),
                ListTile(
                  title: Text("Duration"),
                  trailing: Text("1 hour", style: 
                  TextStyle(
                    fontSize: defaultPaddingSize
                  ),),
                  leading: Icon(Icons.timelapse_outlined),
                ),
                ListTile(
                  title: Text("Consultant"),
                  trailing: Text("Mukasa Abed", style: 
                  TextStyle(
                    fontSize: defaultPaddingSize
                  ),),
                  leading: Icon(Icons.person_pin_circle_outlined),
                ),
                ListTile(
                  title: Text("Reference"),
                  trailing: Text("#SOB10000001", style: 
                  TextStyle(
                    fontSize: defaultPaddingSize,
                    color: Colors.green,
                  ),),
                  leading: Icon(Icons.article_outlined),
                ),                
                ],
                ),
                ),
                );
  }
}