import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/datetime/date_formatter.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/widgets/buttons/back_buttom.dart';

class ResidentsFormScreen extends StatelessWidget {
  static const route = 'ResidentsFormScreen';

  const ResidentsFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: size.width * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wallpapers/house_wallpaper.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.5,
            height: size.height,
            child: const ResidentForm(),
          ),
        ],
      ),
    );
  }
}

class ResidentForm extends StatefulWidget {
  const ResidentForm({Key? key}) : super(key: key);

  @override
  _ResidentFormState createState() => _ResidentFormState();
}

class _ResidentFormState extends State<ResidentForm> {
  final _formKey = GlobalKey<FormState>();
  final _documentController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _blockController = TextEditingController();
  final _appartmenmtController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  String? _documentType;
  String? _formattedDate;
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: (size.width * 0.5) - 40, height: size.height * 0.05),
            const CustomBackButton(),
            const SizedBox(height: 20),
            const Text(
              'Nuevo residente',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _documentType,
              decoration: const InputDecoration(labelText: 'Tipo de Documento'),
              icon: const Icon(Icons.arrow_downward_rounded),
              onChanged: (String? newValue) => setState(() => _documentType = newValue),
              items: <String>['C.C', 'Pasaporte', 'NIT', 'NUIP']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value));
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Documento'),
              controller: _documentController,
              validator: TextValidators.documentValidator,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombres'),
              controller: _firstNameController,
              validator: TextValidators.nameValidator,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Apellidos'),
              validator: TextValidators.nameValidator,
              controller: _lastNameController,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () async {
                final actualDate = DateTime.now();
                _dateTime = await showDatePicker(
                  context: context,
                  initialDate: actualDate,
                  firstDate: DateTime(1950),
                  lastDate: actualDate,
                );
                if (_dateTime != null) {
                  _formattedDate = await DateFormatter.dateFormatted(_dateTime!);
                  setState(() {});
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _formattedDate ?? 'Fecha de nacimiento',
                  style: TextStyle(color: Theme.of(context).hintColor, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              controller: _emailController,
              validator: TextValidators.emailValidator,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Bloque o torre'),
              controller: _blockController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Apartamento'),
              controller: _appartmenmtController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Contraseña'),
              controller: _passwordController,
              validator: TextValidators.passwordValidator,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirma la contraseña'),
              controller: _repeatedPasswordController,
              //TODO: change validator to confirmPasswordValidator
              validator: TextValidators.passwordValidator,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: handleOnCreate,
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                child: const Text('Crear'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void handleOnCreate() {
    if (_formKey.currentState!.validate()) {
      print('Its ready');
      //TODO: add residents_provider
    }
  }
}
