import 'package:buildin_school_app/widgets/widgets_services.dart';
import 'package:flutter/material.dart';

class ForgetPasswrodPage extends StatelessWidget {
  const ForgetPasswrodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          Image.asset(
            "assets/images/forgot-password-illustration-svg-download-png-3551744.webp",
          ),
          Text("Forget Password",style: AppWidgetsServices.HeadLineTextField()),
          Text("No worries, we'll help you out.",style: AppWidgetsServices.logforTextField(),),

        ],
      ),
    );
  }
}
