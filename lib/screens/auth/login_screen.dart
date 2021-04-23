import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const route = 'LoginScreen';

  final _formController = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * 0.5,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withBlue(210),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            child: Form(
              key: _formController,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    validator: TextValidators.emailValidator,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: TextValidators.passwordValidator,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  ElevatedButton(
                    onPressed: handleOnLogin,
                    child: const Text('LOGIN'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: const Text('OR'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('SIGN UP'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleOnLogin() {
    if (_formController.currentState!.validate()) {
      log('All right');
      return;
    }
    log('Error');
  }
}
