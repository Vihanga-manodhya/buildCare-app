import 'package:buildin_school_app/utils/colors.dart';
import 'package:buildin_school_app/widgets/custom_button.dart';
import 'package:buildin_school_app/widgets/custom_input.dart';
import 'package:buildin_school_app/widgets/widgets_services.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/login.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Text(
                "Login In Now",
                style: AppWidgetsServices.HeadLineTextField(),
              ),
              Text(
                "please login to continue using the app",
                style: AppWidgetsServices.logforTextField(),
              ),
               SizedBox(height: 20),

              CustomInput(
                controller: _nicController,
                textName: "V87XXXXXXXXXX",
                maintext: "Enter You Nic",
                iconname:  Icon(Icons.person),
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "NIC is required";
                  }
                  if (value.length < 10) {
                    return "NIC must be at least 10 characters";
                  }
                  return null;
                },
              ),
               SizedBox(height: 15),

              CustomInput(
                controller: _passwordController,
                textName: "******************",
                maintext: "Enter You Password",
                iconname: const Icon(Icons.visibility_off),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
               SizedBox(height: 5),

              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                   
                  },
                  child:  Text("Forgot Password?"),
                ),
              ),

               SizedBox(height: 20),

              GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    String nic = _nicController.text;
                    String password = _passwordController.text;

                   
                  }
                },
                child: CustomButton(
                  buttonName: "Login",
                  buttonColor: kMainColor,
                ),
              ),
               SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("Don't have account ?"),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push("/backlogin");

                      
                    },
                    child: Text(
                      "Sign Up",
                      style: AppWidgetsServices.loginsiguptext(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nicController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
