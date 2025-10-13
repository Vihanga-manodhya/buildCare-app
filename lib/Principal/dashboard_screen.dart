import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // --- Color Palette based on User Request ---
  static const Color darkBackgroundColor = Color(0xFFEDEDED); // Main screen background (EDEDED)
  static const Color cardBackgroundColor = Color(0xFFFFFFFF); // FFFFFF for all cards/fields
  static const Color primaryBlue = Color(0xFF53BDFF); // 53BDFF for blue accents (icons, primary border)
  static const Color viewDetailsBlue = Color(0xFF009DFF); // 009DFF (Retained for View Details button border)
  static const Color darkTextColor = Color(0xFF2C3E50); // Dark text color (for contrast)
  static const Color greyTextColor = Colors.grey; 
  static const Color lightGreyFill = Color(0xFFF5F5F5); // Used for icon/input backgrounds

  // --- Icon Size Constants ---
  static const double defaultCategoryIconSize = 30.0; // Size for Category 1 & 2
  static const double largeCategory3IconSize = 35.0; // Increased size for Category 3 (Manage Master Plans)

  // NOTE: _buildBoundaryBlurLine widget has been REMOVED as requested.

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      // --- 1. Main Background Color (EDEDED) ---
      backgroundColor: darkBackgroundColor, 

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 2. User Info Card (Stretches to Top) ---
            _buildUserInfoSection(statusBarHeight), 
            
            // *** 1. TOP SPACE: After User Info Card (White -> Grey Boundary) ***
            // The 16.0 gap remains, but without the blur shadow.
            const SizedBox(height: 16.0), 

            // --- 3. Action Tiles (Category Fields) ---
            _buildActionTiles(),
            
            // --- 4. My Reported Issues Header ---
            const Padding(
              padding: EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 16.0),
              child: Text(
                'My Reported Issues',
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // --- 5. Reported Issues List ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0), 
              child: Column(
                children: const [ 
                  ReportedIssueCard(
                    schoolName: 'Thurstan Collage',
                    issue: 'Damaged Roof',
                    status: 'Status, Pending Review',
                    date: '2025-09-09',
                    location: 'Colombo',
                  ),
                  const SizedBox(height: 12.0), // EDEDED gap
                  ReportedIssueCard(
                    schoolName: 'Thurstan Collage',
                    issue: 'Damaged Roof',
                    status: 'Status, Pending Review',
                    date: '2025-09-09',
                    location: 'Colombo',
                  ),
                ],
              ),
            ),
            
            // --- Final spacing before bottom boundary ---
            const SizedBox(height: 16), 

            // *** 2. BOTTOM SPACE: Before Bottom Navigation Bar (Grey -> White Boundary) ***
            // The 16.0 gap remains, but without the blur shadow.
            const SizedBox(height: 16.0), 

            // Extra space to push content above the fixed footer
            const SizedBox(height: 65), 
          ],
        ),
      ),

      // --- Bottom Navigation Bar (FFFFFFF with 53BDFF icons) ---
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ---------------------------------------------------------------------------
  // --- Widget Builders ---
  // ---------------------------------------------------------------------------

  Widget _buildUserInfoSection(double statusBarHeight) {
    return Container(
      width: double.infinity,
      // White Card Background FFFFFF
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        // Standard shadow for depth
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      
      padding: EdgeInsets.only(
        top: statusBarHeight + 20.0, 
        left: 24.0, 
        right: 24.0,
        bottom: 20.0,
      ),
      
      child: Row(
        children: [
          // Profile Picture Icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryBlue.withOpacity(0.2), 
              border: Border.all(color: primaryBlue, width: 3), 
              // No shadow/blur
            ),
            child: const Icon(
              Icons.person,
              color: primaryBlue, 
              size: 40, 
            ),
          ),
          const SizedBox(width: 16),
          // Welcome Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: darkTextColor,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Principal\'s name', 
                style: TextStyle(
                  fontSize: 14,
                  color: greyTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the Action Tiles area
  Widget _buildActionTiles() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: const [
          // Card 1
          CardTile(
            icon: Icons.add_circle_outline, 
            title: 'Add Your School Details',
            iconSize: defaultCategoryIconSize, 
          ),
          // EDEDED gap remains
          SizedBox(height: 12.0), 
          // Card 2
          CardTile(
            icon: Icons.construction, 
            title: 'Add Building Issues',
            iconSize: defaultCategoryIconSize, 
          ),
          // EDEDED gap remains
          SizedBox(height: 12.0),
          // Card 3
          CardTile(
            icon: Icons.map_outlined, 
            title: 'Manage Master Plans',
            iconSize: largeCategory3IconSize, // Increased size
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: cardBackgroundColor, // FFFFFF
        // Standard shadow for depth
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home', isActive: true),
          _buildNavItem(Icons.person_outline, 'Profile', isActive: false),
          _buildNavItem(Icons.settings_outlined, 'Settings', isActive: false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    final Color color = primaryBlue; 

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // No shadow/blur on icons
        Icon(icon, color: color, size: 28),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// --- Custom Reusable Widgets ---
// -----------------------------------------------------------------------------

// CardTile for Dashboard Actions (These are the FFFFFF fields)
class CardTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;

  const CardTile({
    required this.icon,
    required this.title,
    required this.iconSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: DashboardScreen.cardBackgroundColor, // FFFFFF
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          // Standard shadow for depth (No Blue Blur Shadow here)
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon with background circle
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: DashboardScreen.primaryBlue.withOpacity(0.2), 
              // No shadow/blur
            ),
            child: Icon(
              icon,
              color: DashboardScreen.primaryBlue, // 53BDFF icon color
              size: iconSize, 
            ),
          ),
          const SizedBox(width: 16),
          // Title
          Expanded( 
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: DashboardScreen.darkTextColor,
              ),
            ),
          ),
          // Arrow icon
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}

// ReportedIssueCard 
class ReportedIssueCard extends StatelessWidget {
  final String schoolName;
  final String issue;
  final String status;
  final String date;
  final String location;

  const ReportedIssueCard({
    required this.schoolName,
    required this.issue,
    required this.status,
    required this.date,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 0.0), 
      decoration: BoxDecoration(
        color: DashboardScreen.cardBackgroundColor, // FFFFFF
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          // Standard shadow for depth (No Blue Blur Shadow here)
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Building Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: DashboardScreen.lightGreyFill, 
            ),
            child: const Icon(
              Icons.business, 
              color: DashboardScreen.darkTextColor, 
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          // Issue Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$schoolName - $issue',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: DashboardScreen.darkTextColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$location - $status',
                  style: const TextStyle(
                    fontSize: 12,
                    color: DashboardScreen.greyTextColor, 
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: DashboardScreen.greyTextColor, 
                  ),
                ),
              ],
            ),
          ),
          // View Details Button
          TextButton(
            onPressed: () {
              // Action for View Details
            },
            style: TextButton.styleFrom(
              backgroundColor: DashboardScreen.cardBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
                side: const BorderSide(color: DashboardScreen.viewDetailsBlue, width: 1), // Border uses the View Details blue
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'View Details',
              style: TextStyle(
                color: DashboardScreen.viewDetailsBlue, // 009DFF text color
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}