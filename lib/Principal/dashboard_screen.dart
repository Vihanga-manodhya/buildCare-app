import 'package:flutter/material.dart';
// 1. Import the original screen files
import 'add_building_issues_screen.dart'; 
import 'add_school_details_screen.dart'; 
// 2. Import the new Master Plan screen
import 'add_master_plan_screen.dart'; 

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // --- Color Palette based on User Request ---
  static const Color darkBackgroundColor = Color(0xFFEDEDED); // Main screen background 
  static const Color cardBackgroundColor = Color(0xFFFFFFFF); // FFFFFF for all cards/fields
  static const Color primaryBlue = Color(0xFF53BDFF); // 53BDFF for blue accents 
  static const Color viewDetailsBlue = Color(0xFF009DFF); // 009DFF 
  static const Color darkTextColor = Color(0xFF2C3E50); // Dark text color 
  static const Color greyTextColor = Colors.grey; 
  static const Color lightGreyFill = Color(0xFFF5F5F5); // Used for icon/input backgrounds

  // --- Icon Size Constants ---
  static const double defaultCategoryIconSize = 30.0; 
  static const double largeCategory3IconSize = 35.0; 

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: darkBackgroundColor, 

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserInfoSection(statusBarHeight), 
            const SizedBox(height: 16.0), 
            _buildActionTiles(context), // Pass context for navigation
            
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
                  SizedBox(height: 12.0), 
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
            
            const SizedBox(height: 65), 
          ],
        ),
      ),

      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // ---------------------------------------------------------------------------
  // --- Widget Builders ---
  // ---------------------------------------------------------------------------

  Widget _buildUserInfoSection(double statusBarHeight) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
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
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryBlue.withOpacity(0.2), 
              border: Border.all(color: primaryBlue, width: 3), 
            ),
            child: const Icon(
              Icons.person,
              color: primaryBlue, 
              size: 40, 
            ),
          ),
          const SizedBox(width: 16),
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

  // Build the Action Tiles area with navigation
  Widget _buildActionTiles(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          // Card 1: Add Your School Details 
          CardTile(
            icon: Icons.add_circle_outline, 
            title: 'Add Your School Details',
            iconSize: defaultCategoryIconSize,
            onTap: () {
              // --- NAVIGATION CODE for Add School Details ---
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddSchoolDetailsScreen()), 
              );
            },
          ),
          
          const SizedBox(height: 12.0), 
          
          // Card 2: Add Building Issues 
          CardTile(
            icon: Icons.construction, 
            title: 'Add Building Issues',
            iconSize: defaultCategoryIconSize,
            onTap: () {
              // --- NAVIGATION CODE for Add Building Issues ---
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddBuildingIssuesScreen()), 
              );
            },
          ),
          
          const SizedBox(height: 12.0),
          
          // Card 3: Manage Master Plans (NAVIGATION ADDED HERE)
          CardTile(
            icon: Icons.map_outlined, 
            title: 'Manage Master Plans',
            iconSize: largeCategory3IconSize, 
            onTap: () {
              // --- NAVIGATION CODE for Add Master Plan Screen ---
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddMasterPlanScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: cardBackgroundColor, 
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
        Icon(icon, color: color, size: 28),
      ],
    );
  }
}

// -----------------------------------------------------------------------------
// --- Custom Reusable Widgets (CardTile & ReportedIssueCard) ---
// -----------------------------------------------------------------------------

class CardTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final VoidCallback? onTap; 

  // FIX: Constructor updated for compatibility (fixing line 197 issue)
  const CardTile({
    required this.icon,
    required this.title,
    required this.iconSize,
    this.onTap, 
    Key? key, // Explicit Key parameter
  }) : super(key: key); // Explicit super call

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onTap, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          color: DashboardScreen.cardBackgroundColor, 
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: DashboardScreen.primaryBlue.withOpacity(0.2), 
              ),
              child: Icon(
                icon,
                color: DashboardScreen.primaryBlue, 
                size: iconSize, 
              ),
            ),
            const SizedBox(width: 16),
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
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class ReportedIssueCard extends StatelessWidget {
  final String schoolName;
  final String issue;
  final String status;
  final String date;
  final String location;

  // FIX: Constructor updated for compatibility
  const ReportedIssueCard({
    required this.schoolName,
    required this.issue,
    required this.status,
    required this.date,
    required this.location,
    Key? key, // Explicit Key parameter
  }) : super(key: key); // Explicit super call

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 0.0), 
      decoration: BoxDecoration(
        color: DashboardScreen.cardBackgroundColor, 
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
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
          TextButton(
            onPressed: () {
              // Action for View Details
            },
            style: TextButton.styleFrom(
              backgroundColor: DashboardScreen.cardBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
                side: const BorderSide(color: DashboardScreen.viewDetailsBlue, width: 1), 
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'View Details',
              style: TextStyle(
                color: DashboardScreen.viewDetailsBlue, 
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