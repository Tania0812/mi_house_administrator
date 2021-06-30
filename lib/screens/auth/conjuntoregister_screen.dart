import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/auth/models/conjuntoregister_model.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';
import 'package:provider/provider.dart';

class ConjuntoRegisterScreen extends StatefulWidget {
  const ConjuntoRegisterScreen({Key? key}) : super(key: key);
  static const route = 'ConjuntoRegisterScreen';
  @override
  _ConjuntoRegisterScreenState createState() => _ConjuntoRegisterScreenState();
}

class _ConjuntoRegisterScreenState extends State<ConjuntoRegisterScreen> {
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
            child: const _LeftSide(),
          ),
          Positioned(
            width: size.width * 0.5,
            left: size.width * 0.5,
            top: 0,
            bottom: 0,
            child: const _RightSide(),
          ),
        ],
      ),
    );
  }
}

class _RightSide extends StatefulWidget {
  const _RightSide({Key? key}) : super(key: key);

  @override
  __RightSidesState createState() => __RightSidesState();
}

class __RightSidesState extends State<_RightSide> {
  final _formController = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _cantBloquesController = TextEditingController();
  final _cantAptosPorBloqueController = TextEditingController();
  final _aptosPorPisoController = TextEditingController();
  final _pisosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  Future<void> handleOnConjuntoRegister() async {
    if (_formController.currentState!.validate()) {
      final res = await Provider.of<AuthProvider>(context, listen: false).conjuntoregister(
        ConjuntoRegisterModel(
          nombre: _nombreController.text.trim(),
          direccion: _direccionController.text.trim(),
          cantBloques: _cantBloquesController.text.trim(),
          cantAptosPorBloque: _cantAptosPorBloqueController.text.trim(),
          aptosPorPiso: _aptosPorPisoController.text.trim(),
          pisos: _pisosController.text.trim(),
        ),
      );
      if (res == null) {
        CustomModals().showWellDone(
          message: 'Conjunto Registrado',
          context: context,
        );
        Navigator.of(context).pushNamed(RegisterScreen.route);
        return;
      }
      await CustomModals().showError(
        message: res.message,
        context: context,
      );
      return;
    }
  }
}

class _LeftSide extends StatelessWidget {
  const _LeftSide({Key? key}) : super(key: key);

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
