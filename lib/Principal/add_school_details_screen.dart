import 'package:flutter/material.dart';

// --- Color Palette for consistency (Updated to match request) ---
const Color darkBackgroundColor = Color(0xFFEDEDED); // Original light grey (used for borders/dividers)
const Color formFieldFillColor = Color(0xFFF3F3F3); // New requested text field background color
const Color cardBackgroundColor = Color(0xFFFFFFFF); // Main form background color (White)
const Color primaryBlue = Color(0xFF53BDFF); 
const Color darkTextColor = Color(0xFF2C3E50); // Black for dropdown icon, text, etc.
const Color greyTextColor = Colors.grey; 
const Color sectionHeaderColor = Color(0xFF53BDFF); 

class AddSchoolDetailsScreen extends StatefulWidget {
  const AddSchoolDetailsScreen({super.key});

  @override
  State<AddSchoolDetailsScreen> createState() => _AddSchoolDetailsScreenState();
}

class _AddSchoolDetailsScreenState extends State<AddSchoolDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _educationalZoneController = TextEditingController();
  final TextEditingController _studentsController = TextEditingController();
  final TextEditingController _teachersController = TextEditingController();
  final TextEditingController _nonAcademicStaffController = TextEditingController();

  // State for dropdown (School Type)
  String? _selectedSchoolType;
  final List<String> _schoolTypes = ['National School', 'Provincial Government', 'Private School', 'Other'];

  // State for Checkboxes (Infrastructure Components)
  Map<String, bool> _infrastructure = {
    'Electricity': false,
    'Water Supply': false,
    'Sanitation': false,
    'Communication Facilities': false,
  };
  
  @override
  void dispose() {
    _schoolNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _educationalZoneController.dispose();
    _studentsController.dispose();
    _teachersController.dispose();
    _nonAcademicStaffController.dispose();
    super.dispose();
  }

  // Handle form submission logic
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Logic for saving data (e.g., to Firestore) goes here
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('School Details Submitted Successfully!'),
          backgroundColor: primaryBlue,
        ),
      );

      _formKey.currentState!.reset();
      setState(() {
        _selectedSchoolType = null;
        _infrastructure = {
          'Electricity': false,
          'Water Supply': false,
          'Sanitation': false,
          'Communication Facilities': false,
        };
      });
    }
  }

  // Custom TextField Builder Widget (Icons removed, focused border removed, new fill color)
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            labelText.split('(').first.trim(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: darkTextColor),
          ),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText.contains('(') ? labelText.split('(').last.replaceAll(')', '').trim() : labelText,
            labelStyle: const TextStyle(color: greyTextColor),
            fillColor: formFieldFillColor, // Updated fill color
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            
            // Border styling (flat look with no focus outline)
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // Removed the blue outline as requested
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'This field is required.';
            }
            return null;
          },
          style: const TextStyle(color: darkTextColor),
        ),
      ],
    );
  }

  // Custom Dropdown Builder Widget (Icon black, focused border removed, new fill color)
  Widget _buildDropdownField({
    required String labelText,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            labelText.split('(').first.trim(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: darkTextColor),
          ),
        ),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            labelText: labelText.contains('(') ? labelText.split('(').last.replaceAll(')', '').trim() : labelText,
            labelStyle: const TextStyle(color: greyTextColor),
            fillColor: formFieldFillColor, // Updated fill color
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            // Border styling consistent with text fields
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder( 
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // Removed the blue outline
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
          ),
          icon: const Icon(Icons.arrow_drop_down, color: darkTextColor), // Updated icon color to black
          isExpanded: true,
          style: const TextStyle(color: darkTextColor),
          items: items.map<DropdownMenuItem<String>>((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item, style: const TextStyle(color: darkTextColor)),
            );
          }).toList(),
          onChanged: onChanged,
          validator: (value) => value == null ? 'Please select a School Type.' : null,
        ),
      ],
    );
  }

  // Custom Infrastructure Checkbox Section (Updated background color)
  Widget _buildInfrastructureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Infrastructure Components',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: darkTextColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: formFieldFillColor, // Match text field background (F3F3F3)
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: darkBackgroundColor, width: 1),
          ),
          child: Column(
            children: _infrastructure.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key, style: const TextStyle(color: darkTextColor)),
                value: _infrastructure[key],
                onChanged: (bool? value) {
                  setState(() {
                    _infrastructure[key] = value!;
                  });
                },
                activeColor: primaryBlue,
                checkColor: cardBackgroundColor,
                controlAffinity: ListTileControlAffinity.trailing, 
                contentPadding: EdgeInsets.zero,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardBackgroundColor, // Main Scaffold background is white
      appBar: AppBar(
        // AppBar Background set to White
        backgroundColor: cardBackgroundColor,
        elevation: 0.0, // Changed to 0.0 for a flatter white look
        // Back Icon (iOS style chevron) and color set to blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: primaryBlue, size: 20), // Changed to iOS style back icon
          onPressed: () {
            // Placeholder for back navigation logic (e.g., Navigator.pop(context))
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text(
          'Add Your School Details',
          style: TextStyle(color: darkTextColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: false, 
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlinedButton( 
              onPressed: _submitForm, 
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primaryBlue, width: 1.5), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              child: const Text(
                'Save', 
                style: TextStyle(
                  color: primaryBlue, 
                  fontWeight: FontWeight.bold
                )
              )
            ),
          ),
        ],
      ),
      body: Container(
        color: cardBackgroundColor, // Body container color changed to white
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // 1. School Name
                _buildTextField(
                  controller: _schoolNameController,
                  labelText: 'School Name (Enter Your School name)',
                ),
                const SizedBox(height: 20),
                
                // 2. School Address
                _buildTextField(
                  controller: _addressController,
                  labelText: 'School Address (Enter Your School Address)',
                  maxLines: 2,
                ),
                const SizedBox(height: 20),
                
                // 3. School Phone Number
                _buildTextField(
                  controller: _phoneNumberController,
                  labelText: 'School Phone Number (Enter Your School Contact Number)',
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 20),

                // 4. School Type (Dropdown)
                _buildDropdownField(
                  labelText: 'School Type (Enter Your School Type)',
                  value: _selectedSchoolType,
                  items: _schoolTypes,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedSchoolType = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),

                // 5. School Educational Zone
                _buildTextField(
                  controller: _educationalZoneController,
                  labelText: 'School Educational Zone (Enter Your School Educational Zone)',
                ),
                const SizedBox(height: 40),

                // --- Staff/Student Numbers Section ---

                // 6. Number of Students
                _buildTextField(
                  controller: _studentsController,
                  labelText: 'Number of Students (Enter Total students in school)',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // 7. Number of Teachers
                _buildTextField(
                  controller: _teachersController,
                  labelText: 'Number of Teachers in School (Enter Total Teachers in School)',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),

                // 8. Number of Non-Academic Staff
                _buildTextField(
                  controller: _nonAcademicStaffController,
                  labelText: 'Number of NonAcademic Staff (Enter Total Number of NonAcadamic Staff)',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 40),

                // 9. Infrastructure Components (Checkboxes)
                _buildInfrastructureSection(),
                
                const SizedBox(height: 40),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}