import 'package:flutter/material.dart';

class ProvincialEngineerDashboard extends StatelessWidget {
  const ProvincialEngineerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard PE',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        // This prevents a back button from showing, which is good after a signup/login
        automaticallyImplyLeading: false, 
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopProfileSection(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Latest Updates',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildUpdateCard('Thurstan College - Damaged Roof',
                'Colombo - Status: Pending Review'),
            _buildUpdateCard('Christ Church Baddegama - Damaged Roof',
                'Galle - Status: Pending Review'),
            // You can add more widgets or sections here
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- Helper Widgets ---

  Widget _buildTopProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFE3F2FD), // Light blue background
      child: Row(
        children: const [
          Icon(Icons.person_pin, size: 60, color: Colors.blue),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Welcome, Provincial Engineer!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateCard(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: const Icon(Icons.apartment_outlined, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: TextButton(
          onPressed: () {
            // Add navigation or action for viewing details
          },
          child: const Text('View'),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: 0, // Default to the 'Home' tab
      onTap: (index) {
        // Handle bottom navigation bar taps here
      },
    );
  }
}