import 'package:buildin_school_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppWidgetsServices {
  static TextStyle HeadLineTextField() {
    return TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  }
  // used login,forget password 
  static TextStyle logforTextField() {
    return TextStyle(fontSize: 16,

     fontWeight: FontWeight.w500);
  }

  static TextStyle MinimumLineTextField() {
    return TextStyle(fontSize: 25,

     fontWeight: FontWeight.bold, color: kBlack);

  }

  static TextStyle loginsiguptext() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: kMainColor,
    );
  }
}
