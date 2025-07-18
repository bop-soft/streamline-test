import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/models/time_slot.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/screens/booking_confirmation_screen.dart';

class TimeSelectionScreen extends StatefulWidget {
  const TimeSelectionScreen({super.key});

  @override
  State<TimeSelectionScreen> createState() => _TimeSelectionScreenState();
}

class _TimeSelectionScreenState extends State<TimeSelectionScreen> {
  final List<TimeSlot> _timeSlots = [
    TimeSlot(time: "9:00 AM", duration: "30 min", isSelected: false),
    TimeSlot(time: "10:00 AM", duration: "30 min", isSelected: false),
    TimeSlot(time: "11:00 AM", duration: "30 min", isSelected: false),
    TimeSlot(time: "12:00 PM", duration: "30 min", isSelected: false),
    TimeSlot(time: "1:00 PM", duration: "30 min", isSelected: false),
    TimeSlot(time: "2:00 PM", duration: "30 min", isSelected: false),
    TimeSlot(time: "3:00 PM", duration: "30 min", isSelected: false),
    TimeSlot(time: "4:00 PM", duration: "30 min", isSelected: false),
    TimeSlot(time: "5:00 PM", duration: "30 min", isSelected: false),
  ];

  TimeSlot? _selectedTimeSlot;

  _onContinuing(){
    if(_selectedTimeSlot != null){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const BookingConfirmationScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
      appBar: StreamlineAppBar.build(context, automaticallyImplyLeading: true),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(defaultPaddingSize),
        child: Container(
          child: StreamlineElevatedButton.build(context, "Continue",
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
                     Text("Select a time slot",
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                    Text("3/4", 
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      color: Colors.green,
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                   ],
                 ),
                const SizedBox(height: 32),   
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                    (
                      crossAxisCount: 2,
                      crossAxisSpacing: defaultPaddingSize,
                      mainAxisSpacing: defaultPaddingSize,
                      ), 
                    itemCount: _timeSlots.length,
                    itemBuilder: (context, index) {
                      final timeSlot = _timeSlots[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTimeSlot = timeSlot;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _selectedTimeSlot == timeSlot ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green),
                          ),
                          child: Text(
                            timeSlot.time,
                            style: TextStyle(
                              color: _selectedTimeSlot == timeSlot ? Colors.white : Colors.green,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                        ),
                      );
                    },),
                ),           
          ],
        ),
      ),
      );
  }
}