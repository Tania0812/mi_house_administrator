import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/routes/routes.dart';
import 'package:mi_house_administrator/core/theme/light_theme.dart';
import 'package:mi_house_administrator/core/util/app_state.dart';
import 'package:mi_house_administrator/screens/auth/landing_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/auth/landing_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('my_house');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomLightTheme.getTheme(),
      navigatorKey: appContext.context,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: LandingScreen.route,
      routes: routes,
    );
  }
}
