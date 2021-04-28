import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/datetime/date_formatter.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/features/residents/models/residents_model.dart';
import 'package:mi_house_administrator/features/residents/models/residents_response.dart';
import 'package:mi_house_administrator/features/residents/residents_provider.dart';
import 'package:mi_house_administrator/widgets/buttons/back_buttom.dart';
import 'package:provider/provider.dart';

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
  final _nombreConjuntoController = TextEditingController();
  final _blockController = TextEditingController();
  final _appartmenmtController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatedPasswordController = TextEditingController();

  String? _documentType;
  String? _formattedDate;
  DateTime? _dateTime;
  bool isNew = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadInitialData();
    });
  }

  void loadInitialData() {
    final resident = ModalRoute.of(context)!.settings.arguments as Residents?;
    if (resident != null) {
      _documentController.text = resident.documento;
      _firstNameController.text = resident.nombres;
      _lastNameController.text = resident.apellidos;
      _nombreConjuntoController.text = resident.conjunto.nombre;
      _emailController.text = resident.email;
      _documentType = resident.tipoDoc;
      _dateTime = resident.fechaNac;
      DateFormatter.dateFormatted(resident.fechaNac).then(
        (val) => setState(() => _formattedDate = val),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resident = ModalRoute.of(context)!.settings.arguments as Residents?;
    isNew = resident == null;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
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
              decoration: const InputDecoration(labelText: 'Nombre del conjunto'),
              controller: _nombreConjuntoController,
              validator: TextValidators.textMandatoryValidator,
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
              validator: isNew ? TextValidators.passwordValidator : null,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirma la contraseña'),
              controller: _repeatedPasswordController,
              validator:
                  isNew ? (v) => TextValidators.confirmPassword(v, _passwordController.text) : null,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: handleOnCreate,
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                child: Text(isNew ? 'Crear' : 'Actualizar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleOnCreate() async {
    if (_formKey.currentState!.validate() && _dateTime != null && _documentType != null) {
      final residentsModel = ResidentsModel(
        nombreConjunto: _nombreConjuntoController.text.trim(),
        apellidos: _lastNameController.text.trim(),
        apto: _appartmenmtController.text.trim(),
        bloque: _blockController.text.trim(),
        documento: _documentController.text.trim(),
        email: _emailController.text.trim(),
        fechaNac: _dateTime!.toIso8601String(),
        nombres: _firstNameController.text.trim(),
        password: _passwordController.text.trim(),
        repeatPassword: _repeatedPasswordController.text.trim(),
        tipoDoc: _documentType!,
      );
      final residentsProv = Provider.of<ResidentsProvider>(context, listen: false);
      final res = isNew
          ? await residentsProv.registerResident(residentsModel)
          : await residentsProv.updateResident(residentsModel);
      if (res == null) {
        await CustomModals().showError(
          message:
              isNew ? 'Residente registrado exitosamente' : 'Residente actualizado exitosamente',
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
