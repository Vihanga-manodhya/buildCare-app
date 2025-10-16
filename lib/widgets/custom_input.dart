import 'package:buildin_school_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String textName;
  final String maintext;
  final Icon iconname;
  final String? Function(String?)? validator;
  final bool obscureText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.textName,
    required this.maintext,
    required this.iconname,
    this.validator,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maintext,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: "Inter",
          ),
        ),
        SizedBox(height: 5),

        TextFormField(
          keyboardType: TextInputType.numberWithOptions(),
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: textName,
            suffixIcon: iconname,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
          ),
        ),
      ],
    );
  }
}

//backpage custom widgets



class BackCustomWidget extends StatelessWidget {
  final String textName;
  final bool isSelected;

  const BackCustomWidget({
    super.key,
    required this.textName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? kMainColor : kLightGreyed,  
          border: Border.all(
            color: isSelected ? kMainColor : Colors.transparent,  
          ),
          boxShadow: isSelected  
              ? [
                  BoxShadow(
                    color: kMainColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            textName,
            style: TextStyle(
              fontSize: 22,
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,  
            ),
          ),
        ),
      ),
    );
  }
}