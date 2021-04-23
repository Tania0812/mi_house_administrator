import 'package:flutter/material.dart';
import 'package:mi_house_administrator/screens/auth/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static const route = 'LandingScreen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * 0.5,
            color: Theme.of(context).primaryColor,
            height: double.infinity,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width * 0.5,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'MI HOUSE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                  ),
                ),
                Text(
                  'Holi tania que estas haciendo',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushNamed(LoginScreen.route),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: Text('Login', style: TextStyle(color: Theme.of(context).primaryColor)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: size.width * 0.45,
                  child: ElevatedButton(
                    //TODO: navigate to sign up
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: const Text('Sign up'),
                  ),
                ),
                SizedBox(height: size.height * 0.010),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
