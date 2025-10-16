import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: buttonColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),

              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
              
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
