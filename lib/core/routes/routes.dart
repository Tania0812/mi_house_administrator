import 'package:flutter/material.dart';
import 'package:mi_house_administrator/screens/auth/landing_screen.dart';
import 'package:mi_house_administrator/screens/auth/login_screen.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LandingScreen.route: (_) => const LandingScreen(),
  LoginScreen.route: (_) => const LoginScreen(),
  RegisterScreen.route: (_) => const RegisterScreen(),
};
