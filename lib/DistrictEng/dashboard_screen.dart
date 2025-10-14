import 'package:flutter/material.dart';

// Import the Manage TOs Screen
import 'manage_to_screen.dart'; 

// --- 1. PLACEHOLDER SCREENS (Navigation Targets) ---

// Placeholder for generic screens (used for Schools, Principals, Activity Details, Review)
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('This is the $title Screen.', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}

// Specific placeholders
class ManageSchoolsScreen extends PlaceholderScreen {
  const ManageSchoolsScreen({super.key}) : super(title: 'Manage Schools');
}
// Note: ManageTosScreen is now imported from 'manage_to_screen.dart'
class ManagePrincipalsScreen extends PlaceholderScreen {
  const ManagePrincipalsScreen({super.key}) : super(title: 'Manage Principals');
}
class ViewDetailsScreen extends PlaceholderScreen {
  const ViewDetailsScreen({super.key}) : super(title: 'Activity Details');
}
class ReviewRequestScreen extends PlaceholderScreen {
  const ReviewRequestScreen({super.key}) : super(title: 'Review Request');
}


// --- 2. MAIN DASHBOARD SCREEN ---

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // A common background color for the dark cards
  final Color _cardColor = Colors.white;
  final Color _backgroundColor = const Color(0xFF2C3E50);

  // Function to handle navigation to a new screen
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            _buildHeader(context),
            
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Overview Card
                    _buildSectionTitle('Overview'),
                    _buildOverviewCard(context),
                    const SizedBox(height: 20),

                    // Recent Activity
                    _buildSectionTitle('Recent Activity'),
                    _buildActivityTile(
                      context,
                      title: 'Thurstan Collage - Damaged Roof',
                      subtitle: 'Colombo - Status: Pending Review',
                      onTap: () => _navigateTo(context, const ViewDetailsScreen()),
                    ),
                    _buildActivityTile(
                      context,
                      title: 'Thurstan Collage - Damaged Roof',
                      subtitle: 'Colombo - Status: Pending Review',
                      onTap: () => _navigateTo(context, const ViewDetailsScreen()),
                    ),
                    const SizedBox(height: 20),
                    
                    // Approval Request
                    _buildSectionTitle('Approval Request'),
                    _buildApprovalRequest(
                      context,
                      requestText: 'Manel Withana request to register as a TO.',
                      onReview: () => _navigateTo(context, const ReviewRequestScreen()),
                    ),
                    const SizedBox(height: 80), // Extra space for bottom navigation overlap
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Helper widget for section titles
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // --- 3. CUSTOM WIDGETS ---

  // Header Widget (Welcome and Profile)
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile Picture
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Color(0xFF5271FF),
            ),
          ),
          const SizedBox(width: 16),
          // Welcome Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'District Engineer',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Overview Card Widget (Metrics and Management Buttons) (UPDATED CALLS)
  Widget _buildOverviewCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Schools
              _buildMetricItem(
                context, 
                'Total Schools', 
                '150', 
                'Manage Schools', 
                () => _navigateTo(context, const ManageSchoolsScreen()),
              ),
              // TOs (NAVIGATES TO NEW SCREEN)
              _buildMetricItem(
                context, 
                'Active TOs', 
                '25', 
                'Manage TOs', 
                () => _navigateTo(context, const ManageTechnicalOfficersScreen()), 
              ),
              // Principals
              _buildMetricItem(
                context, 
                'Pending', 
                '5', 
                'Manage Principals', 
                () => _navigateTo(context, const ManagePrincipalsScreen()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Single Metric Item with its associated button (FIXED LOGIC)
  Widget _buildMetricItem(
    BuildContext context, 
    String title, 
    String count, 
    String buttonText, // Explicit button text to avoid RangeError
    VoidCallback onPressed
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade100)
              ),
              child: Column(
                children: [
                  Text(
                    count,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: _backgroundColor,
                    ),
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: onPressed,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  side: const BorderSide(color: Color(0xFF5271FF)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.white,
                ),
                child: Text(
                  buttonText, // Using the explicit button text
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5271FF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // Recent Activity Tile
  Widget _buildActivityTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.house_outlined, color: Color(0xFF2C3E50), size: 30),
            ),
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            // View Details Button
            TextButton(
              onPressed: onTap,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'View Details',
                style: TextStyle(
                  color: Color(0xFF5271FF),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Approval Request Widget
  Widget _buildApprovalRequest(
    BuildContext context, {
    required String requestText,
    required VoidCallback onReview,
  }) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Request Text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    '• $requestText',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              // Review Button
              ElevatedButton(
                onPressed: onReview,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5271FF),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Review',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar Widget
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: _cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF5271FF)),
            onPressed: () {}, // Already on Home
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}