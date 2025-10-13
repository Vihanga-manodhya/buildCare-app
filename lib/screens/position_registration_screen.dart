import 'package:flutter/material.dart';

// Import each signup screen with a unique prefix to avoid class name conflicts
import 'package:buildcare/Principal/signup_screen.dart' as principal_signup;
import 'package:buildcare/TO/signup.dart' as to_signup;
import 'package:buildcare/DistrictEng/signup.dart' as district_eng_signup;
import 'package:buildcare/ProvincialEng/signup.dart' as provincial_eng_signup;
import 'package:buildcare/ChiefEng/signup.dart' as chief_eng_signup;

class PositionRegistrationScreen extends StatefulWidget {
  const PositionRegistrationScreen({super.key});

  @override
  State<PositionRegistrationScreen> createState() =>
      _PositionRegistrationScreenState();
}

class _PositionRegistrationScreenState
    extends State<PositionRegistrationScreen> {
  String? _selectedPosition;
  // Updated list to include all roles from your file structure
  final List<String> _positions = [
    'Principal',
    'TO',
    'District Engineer',
    'Provincial Engineer',
    'Chief Engineer', // Added this to match your folders
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select Your position to Registration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              // Position selection buttons
              ..._positions.map((position) {
                final isSelected = _selectedPosition == position;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedPosition = position;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? Colors.blue.shade100
                            : Colors.grey.shade200,
                        foregroundColor:
                            isSelected ? Colors.blue.shade800 : Colors.black54,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: isSelected
                                ? Colors.blue.shade300
                                : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: Text(
                        position,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                );
              }).toList(),
              const Spacer(),
              // Get Started button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedPosition != null
                      ? () {
                          // Use a switch statement to navigate to the correct screen
                          navigateToSelectedScreen(_selectedPosition!);
                        }
                      : null, // Button disabled if no position is selected
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF38B6FF),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Get Start Now',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to handle navigation
  void navigateToSelectedScreen(String position) {
    Widget? screen;
    switch (position) {
      case 'Principal':
        screen = const principal_signup.SignUpScreen();
        break;
      case 'TO':
        screen = const to_signup.SignUpScreen();
        break;
      case 'District Engineer':
        screen = const district_eng_signup.SignUpScreen();
        break;
      case 'Provincial Engineer':
        screen = const provincial_eng_signup.SignUpScreen();
        break;
      case 'Chief Engineer':
        screen = const chief_eng_signup.SignUpScreen();
        break;
      default:
        // Optional: handle case where position is unknown
        print('Error: Unknown position selected');
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen!),
    );
  }
}