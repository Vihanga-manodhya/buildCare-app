import 'package:flutter/material.dart';

// Color definitions are duplicated here for consistency with the Dashboard file.
class AppColors {
  static const Color darkBackgroundColor = Color(0xFFFFFFFF); // Changed to White
  static const Color cardBackgroundColor = Color(0xFFFFFFFF); 
  static const Color primaryBlue = Color(0xFF53BDFF); 
  static const Color darkTextColor = Color(0xFF2C3E50);
  static const Color greyTextColor = Colors.grey; 
  static const Color lightGreyFill = Color(0xFFF3F3F3); // Changed to F3F3F3
}

// Converted to StatefulWidget to manage the focus state of the custom upload fields
class AddMasterPlanScreen extends StatefulWidget {
  const AddMasterPlanScreen({super.key});

  @override
  State<AddMasterPlanScreen> createState() => _AddMasterPlanScreenState();
}

class _AddMasterPlanScreenState extends State<AddMasterPlanScreen> {
  // State to manage the focus (tap) effect for the custom upload areas
  bool _isMasterPlanFocused = false;
  bool _isUpdatedPlanFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackgroundColor,
      
      // App Bar matching the structure of other forms and the image
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disable default back button
        leading: IconButton( // Custom back button with chevron icon
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.primaryBlue,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add School Master Plan',
          style: TextStyle(color: AppColors.darkTextColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.cardBackgroundColor,
        elevation: 0, // Flat app bar
        iconTheme: const IconThemeData(color: AppColors.primaryBlue), // Back button color
        actions: [
          // OutlinedButton for the "Save" action with a blue border
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                // TODO: Implement Save action (form submission)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Plan saved successfully! (Not implemented)')),
                );
              },
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                side: const BorderSide(color: AppColors.primaryBlue, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  color: AppColors.primaryBlue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      
      body: SingleChildScrollView(
        // Added vertical padding to match the look in the image
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Center( // Center the constrained content on the screen
          child: ConstrainedBox( // Apply max width for a narrower form
            constraints: const BoxConstraints(maxWidth: 500.0), // Reduced max width to 500.0
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. School Name Input
                _buildLabel('School Name'),
                _buildInputField('Enter Your School name'),
                const SizedBox(height: 20),

                // 2. Upload Master Plan (Initial Plan) - Now uses custom text area
                _buildLabel('Upload Master Plan(JPG/PNG)'),
                _buildUploadArea(
                  'Upload school master plan',
                  _isMasterPlanFocused,
                  (isFocused) {
                    setState(() {
                      _isMasterPlanFocused = isFocused;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // 3. Description Input
                _buildLabel('Description'),
                _buildInputField('describe about school master plan', maxLines: 5),
                const SizedBox(height: 20),

                // 4. Upload Updated Master Plan (Conditional) - Now uses custom text area
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'If newly added building to school,principal should upload their new master plan(JPG/PNG)',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.darkTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                _buildUploadArea(
                  'Upload updated school master plan',
                  _isUpdatedPlanFocused,
                  (isFocused) {
                    setState(() {
                      _isUpdatedPlanFocused = isFocused;
                    });
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Reusable widget to build the label text
  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.darkTextColor,
        ),
      ),
    );
  }

  // Reusable widget for standard text input fields
  Widget _buildInputField(String hintText, {int maxLines = 1}) {
    // Uses AppColors.lightGreyFill (now F3F3F3)
    return TextField(
      maxLines: maxLines,
      cursorColor: AppColors.primaryBlue,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.greyTextColor),
        // Fills the background with light grey (F3F3F3)
        fillColor: AppColors.lightGreyFill,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16, 
          vertical: maxLines > 1 ? 12 : 16,
        ),
        // Styling for border to make it rounded and seamless
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        // Blue border when field is focused
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBlue, width: 2),
        ),
      ),
    );
  }

  // Custom widget for file upload, styled as a text area with a centered icon and focus effect
  // This widget now respects the parent ConstrainedBox width.
  Widget _buildUploadArea(String hintText, bool isFocused, void Function(bool) setFocus) {
    return GestureDetector(
      // Use GestureDetector to manually control the focus (border) state
      onTapDown: (_) => setFocus(true),
      onTapUp: (_) => setFocus(false),
      onTapCancel: () => setFocus(false),
      onTap: () {
        // Implement file picking functionality here
        setFocus(true); // Show the blue border briefly
        // Simulate removing focus after a short delay
        Future.delayed(const Duration(milliseconds: 200), () => setFocus(false)); 
      },
      child: Container(
        height: 120, // Taller height for text area look
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightGreyFill, // Background F3F3F3
          borderRadius: BorderRadius.circular(12),
          // Change border based on the focus state
          border: Border.all(
            color: isFocused ? AppColors.primaryBlue : AppColors.greyTextColor.withOpacity(0.4),
            width: isFocused ? 2 : 1, // Thicker blue border when focused
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the icon and text vertically
          children: [
            const Icon(
              Icons.cloud_upload_outlined, // Upload icon
              color: AppColors.darkTextColor, // Icon color is black
              size: 40,
            ),
            const SizedBox(height: 8),
            Text(
              hintText,
              style: const TextStyle(
                color: AppColors.greyTextColor, 
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}