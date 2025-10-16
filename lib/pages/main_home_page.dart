import 'package:buildin_school_app/utils/colors.dart';
import 'package:buildin_school_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Image.asset(
              "assets/images/buildin.png",
              


              width: double.infinity,
              height: 300,

              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,

                "Southern Province Building Department",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(height: 50),

            GestureDetector(
              onTap: () {
                GoRouter.of(context).push("/login");
              },

              child: CustomButton(
                buttonName: "Get Started",
                buttonColor: kMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
