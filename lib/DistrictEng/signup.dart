import 'package:flutter/material.dart';
// Assuming your DashboardScreen is in a separate file named dashboard_screen.dart
import 'dashboard_screen.dart'; // <--- ADDED IMPORT

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // State variables for dropdowns and password visibility
  String? _selectedUserType;
  String? _selectedOffice;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields to retrieve values (optional, but good practice)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _officePhoneController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  // Dispose controllers to free up memory
  @override
  void dispose() {
    _nameController.dispose();
    _nicController.dispose();
    _emailController.dispose();
    _officePhoneController.dispose();
    _mobileController.dispose();
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

                    // --- Name Field ---
                    _buildLabel('District Engineer Name'),
                    _buildTextField(
                      hint: 'Enter Your Name',
                      icon: Icons.person_outline,
                      controller: _nameController, // Added controller
                    ),
                    const SizedBox(height: 16),

                    // --- NIC Field ---
                    _buildLabel('NIC Number'),
                    _buildTextField(
                      hint: 'Enter Your NIC',
                      icon: Icons.credit_card_outlined,
                      controller: _nicController, // Added controller
                      keyboardType: TextInputType.text, // Assuming text/mixed input for NIC
                    ),
                    const SizedBox(height: 16),

                    // --- Office Dropdown ---
                    _buildLabel('Select Your Office'),
                    _buildOfficeDropdown(),
                    const SizedBox(height: 16),

                    // --- Email Field ---
                    _buildLabel('Email'),
                    _buildTextField(
                      hint: 'Enter Your Email Adress',
                      icon: Icons.email_outlined,
                      controller: _emailController, // Added controller
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        // Simple email regex for basic validation
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Office Phone Field ---
                    _buildLabel('Office Phone Number'),
                    _buildTextField(
                      hint: 'Enter Your Office Phone Number',
                      icon: Icons.phone_in_talk_outlined,
                      controller: _officePhoneController, // Added controller
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),

                    // --- Mobile Number Field ---
                    _buildLabel('Mobile Number'),
                    _buildTextField(
                      hint: 'Enter Your Mobile Number',
                      icon: Icons.phone_android_outlined,
                      controller: _mobileController, // Added controller
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),

                    // --- Security Question Fields ---
                    _buildLabel('First Pet Name'),
                    _buildTextField(
                      hint: 'Enter Your First Pet Name',
                      controller: _petNameController, // Added controller
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Childhood nickname'),
                    _buildTextField(
                      hint: 'Enter Your Childhood nickname',
                      controller: _nicknameController, // Added controller
                    ),
                    const SizedBox(height: 16),

                    // --- Password Field ---
                    _buildLabel('Enter Your Password'),
                    _buildPasswordField(
                      hint: 'Enter Your Password',
                      isPasswordVisible: _isPasswordVisible,
                      controller: _passwordController, // Added controller
                      onToggleVisibility: () {
                        setState(
                          () => _isPasswordVisible = !_isPasswordVisible,
                        );
                      },
                    ),
                    const SizedBox(height: 16),

                    // --- Confirm Password Field ---
                    _buildLabel('Enter Password Again'),
                    _buildPasswordField(
                      hint: 'Re-Enter Your Password',
                      isPasswordVisible: _isConfirmPasswordVisible,
                      controller: _confirmPasswordController, // Added controller
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onToggleVisibility: () {
                        setState(
                          () => _isConfirmPasswordVisible =
                              !_isConfirmPasswordVisible,
                        );
                      },
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

  // Helper widget for form field labels
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

  // Helper widget for standard text fields (Updated to accept controller and keyboardType)
  Widget _buildTextField({
    required String hint,
    IconData? icon,
    TextEditingController? controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
    );
  }

  // Helper widget for password fields (Updated to accept controller)
  Widget _buildPasswordField({
    required String hint,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    TextEditingController? controller,
    String? Function(String?)? validator, // Added optional validator
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Password cannot be empty';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
    );
  }

  // Helper widget for User Type dropdown
  Widget _buildUserTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedUserType,
      hint: const Text('Select Your Roll'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedUserType = newValue;
        });
      },
      items: <String>[
        'Principal',
        'Technical Officer',
        'District Eng.',
        'Chief Eng.',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // Changed to match text field style
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (value) => value == null ? 'Please select a user type' : null,
    );
  }

  // Helper widget for Office dropdown
  Widget _buildOfficeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedOffice,
      hint: const Text('select your office'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOffice = newValue;
        });
      },
      items: <String>['Galle', 'Matara', 'Hambantota']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100, // Changed to match text field style
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none, // Changed to match text field style
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
      ),
      validator: (value) => value == null ? 'Please select an office' : null,
    );
  }

  // Helper widget for the Sign Up button (UPDATED LOGIC)
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
          // Validate returns true if the form is valid, or false otherwise.
          if (_formKey.currentState!.validate()) {
            // If the form is valid, navigate to the Dashboard Screen
            // Using pushReplacement removes the SignUpScreen from the stack, 
            // so the user cannot go back to it with the back button.
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          } else {
            // Optional: Show a generic error if validation fails
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please correct the errors in the form.'),
                backgroundColor: Colors.red,
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
              // You can uncomment this section when you have a Sign In screen
              // recognizer: TapGestureRecognizer()..onTap = () {
              //    print('Navigate to Sign In screen');
              // },
            ),
          ],
        ),
      ),
    );
  }
}
// If you are putting both classes in one file, include the DashboardScreen here:
/*
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildCare Dashboard'),
        backgroundColor: const Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
*/