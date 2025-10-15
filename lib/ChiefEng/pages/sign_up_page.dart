import 'package:buildcare/ChiefEng/pages/chief_home_page.dart';
import 'package:buildcare/ChiefEng/util/colors.dart';
import 'package:buildcare/ChiefEng/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class SignUpPagesfhg extends StatefulWidget {
  const SignUpPagesfhg({super.key});

  @override
  State<SignUpPagesfhg> createState() => _SignUpPagesfhgState();
}

class _SignUpPagesfhgState extends State<SignUpPagesfhg> {
  final _forkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _nicController = TextEditingController();

  final TextEditingController _selectOfficeController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _officenumberController = TextEditingController();
  final TextEditingController _firstpetnameController = TextEditingController();
  final TextEditingController _childhoodnicknameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _conformpasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _nicController.dispose();
    _selectOfficeController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _officenumberController.dispose();
    _firstpetnameController.dispose();
    _childhoodnicknameController.dispose();
    _passwordController.dispose();
    _conformpasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C3E50),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),

              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Form(
                key: _forkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        "Sign Up (ChiefEng.)",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                         // color: kMainColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    CustomInput(
                      obscureText: false,
                      maintext: "Chief Engineer Name ",
                      controller: _nameController,

                      textName: "Enter you  Name ",
                      iconname: Icon(Icons.person_outline),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    CustomInput(
                      obscureText: false,
                      controller: _nicController,
                      textName: "Enter you NIC Number",
                      maintext: "NIC Number",
                      iconname: Icon(Icons.credit_card_sharp),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Nic";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _selectOfficeController,
                      textName: "Enter you Office Number",
                      maintext: "Office Number",
                      iconname: Icon(Icons.account_balance_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Office Number";
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return "Please Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _emailController,
                      textName: "Enter you Email",
                      maintext: "Email",
                      iconname: Icon(Icons.email_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Email";
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return "Please Enter Valid Email";
                        }
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _officenumberController,
                      textName: "Enter you Office Number",
                      maintext: "Office Phone Number",
                      iconname: Icon(Icons.add_business_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Office Number";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _phoneController,
                      textName: "Enter you Mobile Number",
                      maintext: "Mobile Number ",
                      iconname: Icon(Icons.call_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Mobile Number";
                        }
                        if (!RegExp(r'^0[0-9]{9}$').hasMatch(value)) {
                          return "Enter Valid Mobile (e.g., 0771234567)";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _firstpetnameController,
                      textName: "Enter you First Pet Name  ",
                      maintext: "First Pet Name ",
                      iconname: Icon(Icons.manage_accounts_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You pet Name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: false,
                      controller: _childhoodnicknameController,
                      textName: "Enter you Childhood nickname",
                      maintext: "Childhood nickname",
                      iconname: Icon(Icons.group_add_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Childhood nickname";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: true,

                      controller: _passwordController,
                      textName: "Enter you Password ",
                      maintext: "Password ",
                      iconname: Icon(Icons.password_outlined),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Password";
                        }
                        if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    CustomInput(
                      obscureText: true,
                      controller: _conformpasswordController,
                      textName: "Enter you Conform Password ",
                      maintext: "Conform Password ",
                      iconname: Icon(Icons.password_rounded),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter You Conform Password";
                        }
                        if (value != _passwordController.text) {
                          return "Passwords do not match";
                        }

                        return null;
                      },
                    ),
                    SizedBox(height: 15),

                    //todo:

                    // ElevatedButton(
                    //   onPressed: () {
                    //     if (_forkey.currentState!.validate()) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content: Text("Sign Succesfully!! "),
                    //           backgroundColor: Colors.green,
                    //         ),
                    //       );

                    //       Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const HomePage(),
                    //         ),
                    //       );
                    //       //error
                    //     } else {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //           content: Text("Please fix the errors!! "),
                    //           backgroundColor: Colors.red,
                    //         ),
                    //       );
                    //     }
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: kMainColor,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),

                    //   //   child: CustomButton(
                    //   //     buttonName: "SignUp",
                    //   //     buttonColor: kMainColor,
                    //   //   ),
                    //   // ),
                    //   child: Text(
                    //     "Sign up",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_forkey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Sign Up Succesfully!!!"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                            print(_nameController.text);
                            
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fix the errors'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kMainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),

                    //todo:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Registered ?"),
                        Text("Sign in", style: TextStyle(color: kMainColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
