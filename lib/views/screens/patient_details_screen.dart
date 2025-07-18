import 'package:flutter/material.dart';
import 'package:streamline/config/constants.dart';
import 'package:streamline/views/components/streamline_app_bar.dart';
import 'package:streamline/views/components/streamline_elevated_button.dart';
import 'package:streamline/views/components/streamline_text_field.dart';
import 'package:streamline/views/screens/timeline_screen.dart';

class PatientDetailsScreen extends StatefulWidget {
  const PatientDetailsScreen({super.key});

  @override
  State<PatientDetailsScreen> createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  _onContinuing(){
    if(_formKey.currentState!.validate()){
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const TimelineScreen()));
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Personal Details", 
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                    Text("1/4", 
                     textAlign: TextAlign.right,
                     style: TextStyle(
                      color: Colors.green,
                      fontSize: extraHeaderSize,
                      fontWeight: FontWeight.w700
                                   ),),
                   ],
                 ),
                const SizedBox(height: 32),
                StreamlineTextField(label: "First Name",
                controller: _firstNameController,
                validatorText: "First Name is required",
                keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                StreamlineTextField(label: "Last Name",
                controller: _lastNameController,
                validatorText: "Last Name is required",
                keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                StreamlineTextField(label: "Email Address",
                controller: _emailController,
                validatorText: "Email Address is required",
                keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                StreamlineTextField(label: "Phone Number",
                controller: _phoneNumberController,
                validatorText: "Phone Number is required",
                keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}