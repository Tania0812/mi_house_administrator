import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const route = 'RegisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
  final _emailController = TextEditingController();
  final _documentController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _dateController = TextEditingController();
  String? documentType;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Form(
          key: _formController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.10,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: handleOnPop,
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColorLight,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Theme.of(context).primaryColor,
                      size: 70,
                    ),
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
                    )),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                    value: documentType,
                    decoration:
                        const InputDecoration(labelText: 'Tipo de Documento'),
                    icon: const Icon(Icons.arrow_downward_rounded),
                    onChanged: (String? newValue) {
                      setState(() {
                        documentType = newValue;
                      });
                    },
                    items: <String>['C.C', 'Pasaporte', 'NIT', 'NUIP']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _documentController,
                  validator: TextValidators.documentValidator,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Documento',
                      prefixIcon: Icon(Icons.card_membership_outlined)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  validator: TextValidators.nameValidator,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Nombres',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _lastnameController,
                  validator: TextValidators.nameValidator,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: 'Apellidos',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: 'Fecha de nacimiento',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? date = DateTime.now();
                    FocusScope.of(context).requestFocus(FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    _dateController.text = date.toString();
                  },
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
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    child: Text(
                      'Registrarme',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.08),
              ],
            ),
          )),
    );
  }

  void handleOnPop() {
    Navigator.of(context).pop();
    return;
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
