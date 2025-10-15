import 'package:flutter/material.dart';
import 'provincial_engineer_dashboard.dart'; // Make sure this file exists

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // --- State Variables and Controllers ---
  String? _selectedUserType = 'Provincial Engineer';
  String? _selectedOffice = 'Matara';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _officePhoneController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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

  // --- Navigation Function (Link with Dashboard) ---
  void _submitForm() {
    // Validate the form
    if (_formKey.currentState!.validate()) {
      // Show a success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful! Navigating...')),
      );

      // Navigate to the Dashboard, replacing the current screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProvincialEngineerDashboard(),
        ),
      );
    }
  }

  // --- Main Widget Build ---
  @override
  Widget build(BuildContext context) {
    const Color darkBackground = Color(0xFF2C3E50);

    return Scaffold(
      backgroundColor: darkBackground,
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
                    const Center(
                      child: Text(
                        'Signup (Prov.Eng.)',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    _buildLabel('User Type'),
                    _buildUserTypeDropdown(),
                    const SizedBox(height: 16),

                    _buildLabel("Engineer's Name"),
                    _buildTextField(
                      controller: _nameController,
                      hint: 'Enter Your Name',
                      icon: Icons.person_outline,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('NIC Number'),
                    _buildTextField(
                      controller: _nicController,
                      hint: 'Enter Your NIC',
                      icon: Icons.credit_card_outlined,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Select Your Office'),
                    _buildOfficeDropdown(),
                    const SizedBox(height: 16),

                    _buildLabel('Email'),
                    _buildTextField(
                      controller: _emailController,
                      hint: 'Enter Your Email Address',
                      icon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => (value != null &&
                              value.isNotEmpty &&
                              !value.contains('@'))
                          ? 'Enter a valid email'
                          : null,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Office Phone Number'),
                    _buildTextField(
                      controller: _officePhoneController,
                      hint: 'Enter Your Office Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Mobile Number'),
                    _buildTextField(
                      controller: _mobileController,
                      hint: 'Enter Your Mobile Number',
                      icon: Icons.phone_android_outlined,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 16),
                    
                    _buildLabel('First Pet Name (Optional)'),
                    _buildTextField(
                      controller: _petNameController,
                      hint: 'Enter Your First Pet Name',
                      isRequired: false,
                    ),
                    const SizedBox(height: 16),
                    
                    _buildLabel('Childhood Nickname (Optional)'),
                    _buildTextField(
                      controller: _nicknameController,
                      hint: 'Enter Your Childhood Nickname',
                      isRequired: false,
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Enter Your Password'),
                    _buildPasswordField(
                      controller: _passwordController,
                      hint: 'Enter Your Password',
                      isPasswordVisible: _isPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isPasswordVisible = !_isPasswordVisible);
                      },
                    ),
                    const SizedBox(height: 16),

                    _buildLabel('Enter Password Again'),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      hint: 'Re-Enter Your Password',
                      isPasswordVisible: _isConfirmPasswordVisible,
                      onToggleVisibility: () {
                        setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Re-enter your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),

                    _buildSignUpButton(),
                    const SizedBox(height: 20),

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
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    IconData? icon,
    TextInputType keyboardType = TextInputType.text,
    bool isRequired = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return 'This field cannot be empty';
        }
        if (validator != null) {
          return validator(value);
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: onToggleVisibility,
        ),
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
    );
  }

  Widget _buildUserTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedUserType,
      hint: const Text('Select Your Role'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedUserType = newValue;
        });
      },
      items: <String>[
        'Provincial Engineer',
        'Principal',
        'Technical Officer',
        'District Eng.',
        'Chief Eng.'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) => value == null ? 'Please select a user type' : null,
    );
  }

  Widget _buildOfficeDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedOffice,
      hint: const Text('Select your office'),
      onChanged: (String? newValue) {
        setState(() {
          _selectedOffice = newValue;
        });
      },
      items: <String>['Galle', 'Matara', 'Hambantota']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFEFEFEF),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: (value) => value == null ? 'Please select an office' : null,
    );
  }

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
        onPressed: _submitForm,
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

  Widget _buildSignInLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black54, fontSize: 14),
          children: [
            const TextSpan(text: 'Already Registered? '),
            TextSpan(
              text: 'Sign in',
              style: TextStyle(
                color: Colors.blue.shade700,
                fontWeight: FontWeight.bold,
              ),
              // To navigate to a Login screen, you would add a recognizer here
            ),
          ],
        ),
      ),
    );
  }
}