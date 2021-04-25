import 'package:flutter/material.dart';
import 'package:mi_house_administrator/screens/auth/login_screen.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';
import 'package:mi_house_administrator/screens/home/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.route: (ctx) => const LoginScreen(),
  RegisterScreen.route: (ctx) => const RegisterScreen(),
  HomeScreen.route: (ctx) => const HomeScreen(),
};
