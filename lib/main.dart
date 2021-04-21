import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mi_house_administrator/core/routes/routes.dart';
import 'package:mi_house_administrator/core/util/app_state.dart';
import 'package:mi_house_administrator/screens/auth/landing_screen.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: GoogleFonts.openSansTextTheme(),
        primaryColor: const Color(0xFF3F4FA6),
      ),
      navigatorKey: appContext.context,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LandingScreen.route,
      routes: routes,
    );
  }
}
