import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/screens/time_selection_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class DateSelectionScreen extends StatefulWidget {
  const DateSelectionScreen({super.key});

  @override
  State<DateSelectionScreen> createState() => _DateSelectionScreenState();
}

class _DateSelectionScreenState extends State<DateSelectionScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime? _focusedDay;

  _onContinuing(){
    if (_selectedDay != null && _focusedDay != null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TimeSelectionScreen()));
      
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPaddingSize),
          child: Column(
            children: [
                               Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text("Select a date",
                       textAlign: TextAlign.right,
                       style: TextStyle(
                        fontSize: extraHeaderSize,
                        fontWeight: FontWeight.w700
                                     ),),
                      Text("2/4", 
                       textAlign: TextAlign.right,
                       style: TextStyle(
                        color: Colors.green,
                        fontSize: extraHeaderSize,
                        fontWeight: FontWeight.w700
                                     ),),
                     ],
                   ),
                  const SizedBox(height: 32),
                  TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    calendarStyle: CalendarStyle(
                      selectedTextStyle: TextStyle(color: Colors.white),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,                        
                      ),
                      todayTextStyle: TextStyle(color: Colors.white),
                      todayDecoration: BoxDecoration(
                        color: Colors.green.shade100,
                        shape: BoxShape.circle,
                      ),
                    ),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}