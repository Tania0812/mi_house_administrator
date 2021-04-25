import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/auth/models/login_model.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';
import 'package:mi_house_administrator/widgets/buttons/social_network_icon_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: size.width,
            bottom: 0,
            top: 0,
            child: const _RightSide(),
          ),
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            left: isLogin ? 0 : size.width * 0.5,
            width: size.width * 0.5,
            bottom: 0,
            top: 0,
            child: _LeftSide(
              isLogin: isLogin,
              onChangeAuthMode: () {
                setState(() => isLogin = !isLogin);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _LeftSide extends StatefulWidget {
  const _LeftSide({Key? key, required this.isLogin, required this.onChangeAuthMode})
      : super(key: key);
  final VoidCallback onChangeAuthMode;
  final bool isLogin;

  @override
  __LeftSideState createState() => __LeftSideState();
}

class __LeftSideState extends State<_LeftSide> {
  final _formController = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
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
            SizedBox(
              width: double.infinity,
              child: Text(
                'Bienvenido',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
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
            if (!widget.isLogin) ...[
              const SizedBox(height: 20),
              TextFormField(
                controller: _repeatPasswordController,
                validator: TextValidators.passwordValidator,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: 'Confirma tu contraseña',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
            ],
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: widget.isLogin ? handleOnLogin : handleOnRegister,
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                child: Text(widget.isLogin ? 'Iniciar sesión' : 'Registrarme'),
              ),
            ),
            const SizedBox(height: 10),
            if (widget.isLogin)
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
                onPressed: widget.onChangeAuthMode,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(color: Colors.grey, width: 0.8),
                ),
                child: Text(
                  !widget.isLogin ? 'Iniciar sesión' : 'Registrarme',
                  style: TextStyle(color: Colors.grey[800]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleOnLogin() async {
    if (_formController.currentState!.validate()) {
      final res = await Provider.of<AuthProvider>(context, listen: false).login(
        LoginModel(email: _emailController.text.trim(), password: _passwordController.text.trim()),
      );
      if (res == null) {
        //TODO: Navigate to home
      } else {
        CustomModals().showError(message: res.message, context: context);
      }
      return;
    }
  }

  void handleOnRegister() {
    if (_formController.currentState!.validate()) {
      //TODO: Pass arguments to RegisterScreen
      Navigator.of(context).pushNamed(RegisterScreen.route);
      return;
    }
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
          color: Theme.of(context).scaffoldBackgroundColor,
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
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/wallpapers/house_wallpaper1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
