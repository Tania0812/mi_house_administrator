import 'package:flutter/material.dart';
import 'package:mi_house_administrator/screens/auth/landing_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LandingScreen.route: (_) => const LandingScreen(),
};
