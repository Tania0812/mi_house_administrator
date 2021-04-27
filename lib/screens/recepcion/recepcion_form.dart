import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/datetime/date_formatter.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/features/recepcion/models/recepcion_model.dart';
import 'package:mi_house_administrator/features/recepcion/recepcion_provider.dart';
import 'package:mi_house_administrator/widgets/buttons/back_buttom.dart';
import 'package:provider/provider.dart';

class RecepcionFormScreen extends StatelessWidget {
  static const route = 'RecepcionFormScreen';

  const RecepcionFormScreen({Key? key}) : super(key: key);

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
            child: const RecepcionForm(),
          ),
        ],
      ),
    );
  }
}

class RecepcionForm extends StatefulWidget {
  const RecepcionForm({Key? key}) : super(key: key);

  @override
  _RecepcionFormState createState() => _RecepcionFormState();
}

class _RecepcionFormState extends State<RecepcionForm> {
  final _formKey = GlobalKey<FormState>();
  final _documentController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
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
              'Nuevo recepción',
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Future<void> handleOnCreate() async {
    if (_formKey.currentState!.validate() && _dateTime != null && _documentType != null) {
      final recepcionModel = RecepcionModel(
        apellidos: _lastNameController.text.trim(),
        documento: _documentController.text.trim(),
        email: _emailController.text.trim(),
        fechaNac: _dateTime!.toIso8601String(),
        nombres: _firstNameController.text.trim(),
        password: _passwordController.text.trim(),
        repeatPassword: _repeatedPasswordController.text.trim(),
        tipoDoc: _documentType!,
      );

      final res = await Provider.of<RecepcionProvider>(context, listen: false)
          .registerResident(recepcionModel);
      if (res == null) {
        await CustomModals().showError(
          message: 'Recepcion registrado exitosamente',
          context: context,
          title: 'Felicitaciones',
        );
        Navigator.of(context).pop();
        return;
      }
      await CustomModals().showError(
        message: res.message,
        context: context,
      );
    }
    if (_dateTime == null) {
      await CustomModals().showError(message: 'Selecciona una fecha', context: context);
    }
    if (_documentType == null) {
      await CustomModals().showError(message: 'Selecciona un tipo de documento', context: context);
    }
  }
}
