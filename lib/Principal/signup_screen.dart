import 'package:flutter/material.dart';
// Import the new dashboard file
import 'dashboard_screen.dart'; 

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // --- State variables for dropdowns and password visibility ---
  String? _selectedUserType;
  String? _selectedSchoolType; // New state variable
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // --- Controllers for all text fields (UPDATED) ---
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _schoolNameController = TextEditingController();
  final TextEditingController _schoolEmailController = TextEditingController();
  final TextEditingController _schoolPhoneController = TextEditingController();
  final TextEditingController _principalNameController = TextEditingController();
  final TextEditingController _principalMobileController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    // Dispose controllers to free up memory
    _nicController.dispose();
    _schoolNameController.dispose();
    _schoolEmailController.dispose();
    _schoolPhoneController.dispose();
    _principalNameController.dispose();
    _principalMobileController.dispose();
    _petNameController.dispose();
    _nicknameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50), // Dark background color
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // --- User Type Dropdown ---
                    _buildLabel('User Type'),
                    _buildUserTypeDropdown(),
                    const SizedBox(height: 16),

                    // --- NIC Field ---
                    _buildLabel('NIC Number'),
                    _buildTextField(
                        controller: _nicController,
                        hint: 'Enter Your NIC',
                        icon: Icons.credit_card_outlined),
                    const SizedBox(height: 16),

                    // --- School Name Field ---
                    _buildLabel('School Name'),
                    _buildTextField(
                        controller: _schoolNameController,
                        hint: 'Enter Your School name',
                        icon: Icons.home_outlined),
                    const SizedBox(height: 16),

                    // --- School Type Dropdown ---
                    _buildLabel('School Type'),
                    _buildSchoolTypeDropdown(), // New dropdown
                    const SizedBox(height: 16),

                    // --- School Email Field ---
                    _buildLabel('School Email'),
                    _buildTextField(
                        controller: _schoolEmailController,
                        hint: 'Enter Your Email Adress',
                        icon: Icons.email_outlined),
                    const SizedBox(height: 16),

                    // --- School Phone Field ---
                    _buildLabel('School Phone Number'),
                    _buildTextField(
                        controller: _schoolPhoneController,
                        hint: 'Enter Your School Phone Number',
                        icon: Icons.phone_in_talk_outlined),
                    const SizedBox(height: 16),

                    // --- Principal Name Field ---
                    _buildLabel('Principal Name'),
                    _buildTextField(
                        controller: _principalNameController,
                        hint: 'Enter Principal Name',
                        icon: Icons.person_outline),
                    const SizedBox(height: 16),

                    // --- Principal's Mobile Number Field ---
                    _buildLabel('Principal\'s Mobile Number'),
                    _buildTextField(
                        controller: _principalMobileController,
                        hint: 'Enter Principal\'s Mobile Number',
                        icon: Icons.phone_android_outlined),
                    const SizedBox(height: 16),
                    
                    // --- Security Question Fields ---
                    _buildLabel('First Pet Name'),
                    _buildTextField(
                        controller: _petNameController,
                        hint: 'Enter Your First Pet Name'),
                    const SizedBox(height: 16),

                    _buildLabel('Childhood nickname'),
                    _buildTextField(
                        controller: _nicknameController,
                        hint: 'Enter Your Childhood nickname'),
                    const SizedBox(height: 16),

                    // --- Password Field ---
                    _buildLabel('Principal\'s Password'),
                    _buildPasswordField(
                      controller: _passwordController,
                      hint: 'Enter Your Password',
                      isPasswordVisible: _isPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Confirm Password Field ---
                    _buildLabel('Enter Password Again'),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      hint: 'Re-Enter Your Password',
                      isPasswordVisible: _isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                      },
                      isConfirm: true, // Flag for password matching
                    ),
                    const SizedBox(height: 30),

                    // --- Sign Up Button ---
                    _buildSignUpButton(),
                    const SizedBox(height: 20),

                    // --- Sign In Link ---
                    _buildSignInLink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }

  // Helper widget for standard text fields
  Widget _buildTextField({
    required String hint, 
    IconData? icon, 
    required TextEditingController controller
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field cannot be empty';
        }
        return null;
      },
    );
  }

  // Helper widget for password fields
  Widget _buildPasswordField({
    required String hint,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    required TextEditingController controller,
    bool isConfirm = false, 
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: onToggleVisibility,
        ),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password cannot be empty';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (isConfirm && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  // Helper widget for User Type dropdown (Simplified based on image: now only 'Principal' is relevant)
  Widget _buildUserTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedUserType,
      hint: const Text('Select Your Roll'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedUserType = newValue;
        });
      },
      items: <String>['Principal'] // Filtered list to match Principal signup context
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: _getDropdownDecoration(),
      validator: (value) => value == null ? 'Please select a user type' : null,
    );
  }
  
  // NEW Helper widget for School Type dropdown
  Widget _buildSchoolTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedSchoolType,
      hint: const Text('Select a school type'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedSchoolType = newValue;
        });
      },
      items: <String>['National School', 'Provincial School', 'Private School']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: _getDropdownDecoration(),
      validator: (value) => value == null ? 'Please select a school type' : null,
    );
  }
  
  // Unified style for all dropdowns
  InputDecoration _getDropdownDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey.shade100, // Use a lighter background to match the text fields
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  // Helper widget for the Sign Up button
  Widget _buildSignUpButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF38B6FF), Color(0xFF5271FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          // Validate the form before navigating
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration successful! Navigating to Dashboard...')),
            );

            // Navigate to DashboardScreen using pushReplacement
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Helper widget for the "Already Registered?" link
  Widget _buildSignInLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black54, fontSize: 14),
          children: [
            const TextSpan(text: 'Already Registered ? '),
            TextSpan(
              text: 'Sign in',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
              // Add navigation logic to your Sign In screen here
            ),
          ],
        ),
      ),
    );
  }
}