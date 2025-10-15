import 'package:flutter/material.dart';

// --- PLACEHOLDER SCREENS FOR NAVIGATION (Copied from the first file) ---

// Placeholder for generic screens (used for all document views)
class DocumentViewerScreen extends StatelessWidget {
  final String title;
  const DocumentViewerScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // Color used in the original DocumentViewerScreen
        backgroundColor: const Color(0xFF2C3E50), 
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text('Viewing $title', style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}

// Specific placeholders for clarity
class ViewSchoolMasterPlanScreen extends DocumentViewerScreen {
  const ViewSchoolMasterPlanScreen({super.key})
      : super(title: 'School Master Plan');
}

class ViewDamageDetailsScreen extends DocumentViewerScreen {
  const ViewDamageDetailsScreen({super.key})
      : super(title: 'Damage Details');
}

class ViewContractDetailsScreen extends DocumentViewerScreen {
  const ViewContractDetailsScreen({super.key})
      : super(title: 'Contract Details');
}

// New Screen for Pending Principals (Renamed from TOs)
class PendingPrincipalsScreen extends DocumentViewerScreen {
  const PendingPrincipalsScreen({super.key})
      : super(title: 'Pending Principal Requests');
}


// --- MAIN MANAGE PRINCIPALS SCREEN (Restyled) ---

class ManagePrincipalsScreen extends StatelessWidget {
  const ManagePrincipalsScreen({Key? key}) : super(key: key);

  // --- Theme Constants from ManageTechnicalOfficersScreen ---
  final Color _cardColor = Colors.white;
  final Color _accentBlue = const Color(0xFF5271FF);
  final Color _darkText = const Color(0xFF2C3E50);
  final Color _metricCardBackground = const Color(0xFFADD8E6); // Light Blue

  // Function to handle navigation (Copied from the first file)
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color to match the first screen
      backgroundColor: _cardColor, 
      appBar: AppBar(
        backgroundColor: _cardColor,
        elevation: 0,
        // Using the same leading icon button style as the first screen
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Manage Principals',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Metric Cards (2x2 Grid) ---
            _buildMetricGrid(context),
            const SizedBox(height: 24),

            // --- Search Bar ---
            _buildSearchBar(),
            const SizedBox(height: 24),

            // --- Document/Action Buttons ---
            // Action 1: View School Master Plan
            _buildDocumentTile(
              context,
              title: 'View School Master Plan',
              icon: Icons.description_outlined,
              onTap: () => _navigateTo(context, const ViewSchoolMasterPlanScreen()),
            ),
            
            // Action 2: View Damage Details (Using custom icon stacking)
            _buildDocumentTile(
              context,
              title: 'View Damage Details',
              icon: Icons.file_copy_outlined,
              // Custom icon stacking (matching the lock/file look)
              customIcon: _buildCustomIcon(Icons.description_outlined, Icons.lock_open, size: 30), 
              onTap: () => _navigateTo(context, const ViewDamageDetailsScreen()),
            ),
            
            // Action 3: View Contract Details (Using custom icon stacking)
            _buildDocumentTile(
              context,
              title: 'View Contract Details',
              icon: Icons.edit_note_outlined,
              // Custom icon stacking (matching the pencil/assignment look)
              customIcon: _buildCustomIcon(Icons.assignment_outlined, Icons.edit, size: 30),
              onTap: () => _navigateTo(context, const ViewContractDetailsScreen()),
            ),
            const SizedBox(height: 80), 
          ],
        ),
      ),
      // --- Bottom Navigation Bar ---
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // --- WIDGETS COPIED AND ADAPTED FROM ManageTechnicalOfficersScreen ---

  // 2x2 Grid of Metric Cards
  Widget _buildMetricGrid(BuildContext context) {
    // childAspectRatio is 1.8 in the original TO screen
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0, // Same spacing as original
      mainAxisSpacing: 16.0, // Same spacing as original
      childAspectRatio: 1.8,
      children: [
        // Total Principals (Not clickable)
        _buildMetricCard('Total Principals', '25', Icons.people_outline),
        
        // Pending (CLICKABLE - Navigates to PendingPrincipalsScreen)
        InkWell(
          onTap: () => _navigateTo(context, const PendingPrincipalsScreen()),
          child: _buildMetricCard('Pending', '5', Icons.schedule),
        ),
        
        // Active Principals (Not clickable)
        _buildMetricCard('Active Principals', '20', Icons.star),
        
        // Schools (Not clickable)
        _buildMetricCard('Schools', '150', Icons.apartment),
      ],
    );
  }

  // Single Metric Card (Non-Interactive Container) - Copied and adapted
  Widget _buildMetricCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // Use the same background color with opacity and border radius/box shadow
        color: _metricCardBackground.withOpacity(0.5), 
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: _darkText,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 28, // Smaller than original Principal screen (was 32)
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                ),
              ),
              Icon(
                icon,
                color: _accentBlue,
                size: 30, // Smaller than original Principal screen (was 40)
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Custom icon stacking to better match the design image - Copied
  Widget _buildCustomIcon(IconData baseIcon, IconData overlayIcon, {double size = 30}) {
    return SizedBox(
      width: size + 10,
      height: size + 10,
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 0,
            child: Icon(baseIcon, size: size, color: _accentBlue),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Icon(overlayIcon, size: size / 2, color: _accentBlue),
          ),
        ],
      ),
    );
  }

  // Search Bar Widget - Copied and adapted
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Matching the first screen's grey background
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Principals.......', // Updated hint text
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }

  // Document Action Tile - Copied and adapted
  Widget _buildDocumentTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Widget? customIcon,
  }) {
    // The original TO screen used Padding and InkWell around a Container
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _darkText,
                ),
              ),
              customIcon ?? Icon(
                icon,
                color: _accentBlue,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Bottom Navigation Bar - Copied and adapted
  Widget _buildBottomNavigationBar() {
    // This is the custom container-based bottom nav from the first screen
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
            icon: const Icon(Icons.home_outlined, color: Colors.grey),
            onPressed: () {}, 
          ),
          IconButton(
            icon: Icon(Icons.person, color: _accentBlue), // Active icon uses accent blue
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