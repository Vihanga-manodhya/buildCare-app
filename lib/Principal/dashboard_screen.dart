import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildCare Dashboard 🛠️'),
        // Prevents the back arrow from appearing after a sign-up/login
        automaticallyImplyLeading: false, 
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline, 
                color: Colors.green, 
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to BuildCare!',
                style: TextStyle(
                  fontSize: 24, 
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'You have successfully signed up and reached your dashboard.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16, 
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Navigate back to the sign-up/login screen
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}