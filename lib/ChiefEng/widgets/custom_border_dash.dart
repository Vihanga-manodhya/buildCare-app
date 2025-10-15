import 'package:buildcare/ChiefEng/util/custom_services.dart';
import 'package:flutter/material.dart';

class CustomBorderDash extends StatelessWidget {
  const CustomBorderDash({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
      child: Container(
        
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset("assets/user_pro.png", fit: BoxFit.cover, height: 60),
            SizedBox(width: 20),

            Column(
              children: [
                Text("Welcome !", style: AppWidgets.HeadLineTextField()),
                Text(
                  "Chief Engineer",
                  style: AppWidgets.MinimumLineTextField(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
