import 'package:buildin_school_app/pages/DistricEnginer/distric_enginer_page.dart';
import 'package:buildin_school_app/pages/To/to_page.dart';
import 'package:buildin_school_app/pages/auth/forget_password_page.dart';
import 'package:buildin_school_app/pages/auth/login_page.dart';
import 'package:buildin_school_app/pages/back_login_page.dart';
import 'package:buildin_school_app/pages/main_home_page.dart';
import 'package:buildin_school_app/pages/principal/principal_page.dart';
import 'package:buildin_school_app/pages/provicialEngi/provincial_enginer_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return MaterialPage(
        child: Scaffold(body: Center(child: Text("This page is not valide"))),
      );
    },

    routes: [
      GoRoute(
        path: "/",
        name: "mainpage",
        builder: (context, state) {
          return MainHomePage();
        },
      ),

     
      GoRoute(
        path: "/login",
        name: "login",
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        path: "/forgetpassword",
        name: "forgetpassword",
        builder: (context, state) {
          return ForgetPasswrodPage();
        },
      ),
      GoRoute(
        path: "/backlogin",
        name: "backlogin",
        builder: (context, state) {
          return BackLoginPage();
        },
      ),
      GoRoute(
        path: "/principal",
        name: "principal",
        builder: (context, state) {
          return PrincipalSignupPage();
        },
      ),
      GoRoute(
        path: "/to",
        name: "to",
        builder: (context, state) {
          return ToSignupPage();
        },
      ),
      GoRoute(
        path: "/districenginer",
        name: "districenginer",
        builder: (context, state) {
          return DistricSignupPage();
        },
      ),
      
      GoRoute(
        path: "/provincialenginer",
        name: "provincialenginer",
        builder: (context, state) {
          return ProvincialEnginerSignupPage();
        },
      ),
    ],
  );
}
