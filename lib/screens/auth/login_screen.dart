import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/widgets/buttons/social_network_icon_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          _LeftSide(),
          const _RightSide(),
        ],
      ),
    );
  }
}

class _LeftSide extends StatelessWidget {
  final _formController = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      width: size.width * 0.5,
      child: Form(
        key: _formController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.home, color: Theme.of(context).primaryColor, size: 70),
                const SizedBox(width: 10),
                Text(
                  'Mi House',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              validator: TextValidators.emailValidator,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              validator: TextValidators.passwordValidator,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: handleOnLogin,
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                child: const Text('Iniciar sesión'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            const SocialNetworkIcons(),
            const SizedBox(height: 10),
            const _Divider(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(color: Colors.grey, width: 0.8),
                ),
                child: Text('Registrarme', style: TextStyle(color: Colors.grey[800])),
              ),
            ),
          ],
        ),
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

class _Divider extends StatelessWidget {
  const _Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Container(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: const Text('o', style: TextStyle(color: Colors.grey)),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}

class _RightSide extends StatelessWidget {
  const _RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.5,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wallpapers/house_wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
