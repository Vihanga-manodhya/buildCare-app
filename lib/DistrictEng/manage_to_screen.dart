import 'package:flutter/material.dart';

// --- PLACEHOLDER SCREENS FOR NAVIGATION ---

// Placeholder for generic screens (used for all document views)
class DocumentViewerScreen extends StatelessWidget {
  final String title;
  const DocumentViewerScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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

// New Screen for Pending TOs
class PendingTOsScreen extends DocumentViewerScreen {
  const PendingTOsScreen({super.key})
      : super(title: 'Pending TO Requests');
}


// --- MAIN TECHNICAL OFFICERS SCREEN ---

class ManageTechnicalOfficersScreen extends StatelessWidget {
  const ManageTechnicalOfficersScreen({super.key});

  final Color _cardColor = Colors.white;
  final Color _accentBlue = const Color(0xFF5271FF);
  final Color _darkText = const Color(0xFF2C3E50);

  // Function to handle navigation
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _cardColor, 
      appBar: AppBar(
        backgroundColor: _cardColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Manage Technical Officers',
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
            _buildDocumentTile(
              context,
              title: 'View School Master Plan',
              icon: Icons.description_outlined,
              onTap: () => _navigateTo(context, const ViewSchoolMasterPlanScreen()),
            ),
            _buildDocumentTile(
              context,
              title: 'View Damage Details',
              icon: Icons.file_copy_outlined,
              // Custom icon stacking (for damage details file look)
              customIcon: _buildCustomIcon(Icons.description_outlined, Icons.lock_open, size: 30), 
              onTap: () => _navigateTo(context, const ViewDamageDetailsScreen()),
            ),
            _buildDocumentTile(
              context,
              title: 'View Contract Details',
              icon: Icons.edit_note_outlined,
              // Custom icon stacking (for contract details pencil look)
              customIcon: _buildCustomIcon(Icons.assignment_outlined, Icons.edit, size: 30),
              onTap: () => _navigateTo(context, const ViewContractDetailsScreen()),
            ),
            const SizedBox(height: 80), 
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 2x2 Grid of Metric Cards
  Widget _buildMetricGrid(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      childAspectRatio: 1.8,
      children: [
        // Total TOs (Not clickable)
        _buildMetricCard('Total TOs', '25', Icons.people, isPrimary: true),
        
        // Pending (CLICKABLE - Navigates to PendingTOsScreen)
        InkWell(
          onTap: () => _navigateTo(context, const PendingTOsScreen()),
          child: _buildMetricCard('Pending', '5', Icons.schedule, isPrimary: true),
        ),
        
        // Active TOs (Not clickable)
        _buildMetricCard('Active TOs', '20', Icons.star, isPrimary: true),
        
        // Schools (Not clickable)
        _buildMetricCard('Schools', '150', Icons.apartment, isPrimary: true),
      ],
    );
  }

  // Single Metric Card (Non-Interactive Container)
  Widget _buildMetricCard(String title, String value, IconData icon, {bool isPrimary = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFADD8E6).withOpacity(0.5), 
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
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: _darkText,
                ),
              ),
              Icon(
                icon,
                color: _accentBlue,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Custom icon stacking to better match the design image
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

  // Search Bar Widget
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search TOs.......',
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }

  // Document Action Tile
  Widget _buildDocumentTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Widget? customIcon,
  }) {
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
  
  // Bottom Navigation Bar
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
            icon: const Icon(Icons.home_outlined, color: Colors.grey),
            onPressed: () {}, 
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xFF5271FF)),
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