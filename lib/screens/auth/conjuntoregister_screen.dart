import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/auth/models/conjuntoregister_model.dart';
import 'package:mi_house_administrator/screens/auth/register_screen.dart';
import 'package:mi_house_administrator/widgets/buttons/back_buttom.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  padding: const EdgeInsets.only(top: 20.0, bottom: 31, left: 15.0, right: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _formController,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CustomBackButton(),
                                const SizedBox(width: 20.0),
                                Text(
                                  'Registra tu conjunto',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _nombreController,
                              validator: TextValidators.nameConjValidator,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Nombre conjunto',
                                const Icon(
                                  Icons.assignment_ind,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _direccionController,
                              validator: TextValidators.directionValidator,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Direccion',
                                const Icon(
                                  FontAwesomeIcons.directions,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _cantBloquesController,
                              validator: TextValidators.cantBloqValidator,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Cantidad de bloques',
                                const Icon(
                                  FontAwesomeIcons.city,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _cantAptosPorBloqueController,
                              validator: TextValidators.cantAptBloqValidator,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Apartamentos por bloque',
                                const Icon(Icons.business_rounded),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _aptosPorPisoController,
                              validator: TextValidators.aptPValidator,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Apartamentos por piso',
                                const Icon(
                                  Icons.apartment_rounded,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              controller: _pisosController,
                              validator: (_pisosControlelr) => TextValidators.confirmAptos(
                                  _cantAptosPorBloqueController.text,
                                  _aptosPorPisoController.text,
                                  _pisosController.text),
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.black),
                              decoration: decoration(
                                '  Pisos',
                                const Icon(
                                  FontAwesomeIcons.solidBuilding,
                                  size: 20,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            SizedBox(
                              width: double.maxFinite,
                              height: 45,
                              child: ElevatedButton(
                                  onPressed: () {
                                    handleOnConjuntoRegister();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor),
                                  child: const Text('Registrar')),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration decoration(String labeltextinput, Icon iconprefix) {
    return InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 30, maxHeight: 50),
      labelText: labeltextinput,
      labelStyle: const TextStyle(color: Colors.black),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black26),
      ),
      prefixIcon: iconprefix,
    );
  }

  Future<void> handleOnConjuntoRegister() async {
    if (_formController.currentState!.validate()) {
      final conjunto = ConjuntoRegisterModel(
        nombre: _nombreController.text.trim(),
        direccion: _direccionController.text.trim(),
        cantBloques: _cantBloquesController.text.trim(),
        cantAptosPorBloque: _cantAptosPorBloqueController.text.trim(),
        aptosPorPiso: _aptosPorPisoController.text.trim(),
        pisos: _pisosController.text.trim(),
      );
      final res =
          await Provider.of<AuthProvider>(context, listen: false).conjuntoregister(conjunto);
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
