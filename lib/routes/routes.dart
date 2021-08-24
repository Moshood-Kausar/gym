import 'package:flutter/material.dart';
import 'package:gym/auth/login_page.dart';
import 'package:gym/auth/intro_one.dart';
import 'package:gym/auth/intro_three.dart';
import 'package:gym/auth/intro_two.dart';
import 'package:gym/screen/dashboard/main_page.dart';
import 'package:gym/screen/dashboard/sign_up.dart';

class NavigateRoute {
  static Map<String, Widget Function(BuildContext context)> routes = {
    '/intro1': (_) => IntroOneScreen(),
    '/intro2': (_) => IntroTwoScreen(),
    '/intro3': (_) => IntroThreeScreen(),
    '/login': (_) => LoginScreen(),
    '/homepage': (_) => MainPage(),
    '/signup':(_)=>SingUpScreen(),
  };
}
