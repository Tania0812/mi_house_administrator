import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/modals/modals.dart';
import 'package:mi_house_administrator/core/validators/text_validators.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/residents/models/space_model.dart';
import 'package:mi_house_administrator/features/residents/models/spaces_response.dart';
import 'package:mi_house_administrator/features/residents/residents_provider.dart';
import 'package:mi_house_administrator/widgets/buttons/back_buttom.dart';
import 'package:provider/provider.dart';

class SpacesFormScreen extends StatelessWidget {
  static const route = 'SpacesFormScreen';

  const SpacesFormScreen({Key? key}) : super(key: key);

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
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _aforoController = TextEditingController();
  final _conjuntoController = TextEditingController();
  final _typeController = TextEditingController();

  bool isAvaliable = false;
  bool isNew = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadInitialData();
    });
  }

  void loadInitialData() {
    _conjuntoController.text = Provider.of<AuthProvider>(context, listen: false).auth!.conjunto!;
    final resident = ModalRoute.of(context)!.settings.arguments as Spaces?;
    if (resident != null) {
      _nameController.text = resident.nombre;
      _priceController.text = resident.precio;
      _aforoController.text = resident.aforo;
      _typeController.text = resident.tipo;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final resident = ModalRoute.of(context)!.settings.arguments as Spaces?;
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
              'Nuevo espacio',
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 28),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
              controller: _nameController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Precio'),
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Aforo'),
              controller: _aforoController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Tipo'),
              controller: _typeController,
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Conjunto'),
              enabled: false,
              controller: _conjuntoController,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('¿Esta disponible?'),
                Switch.adaptive(
                  value: isAvaliable,
                  onChanged: (v) => setState(() => isAvaliable = v),
                ),
              ],
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
    if (_formKey.currentState!.validate()) {
      final residentsModel = SpacesModel(
        nombre: _nameController.text.trim(),
        disponible: isAvaliable,
        precio: int.tryParse(_priceController.text)!,
        aforo: int.tryParse(_aforoController.text)!,
        conjunto: _conjuntoController.text.trim(),
        tipo: _typeController.text.trim(),
      );
      final residentsProv = Provider.of<ResidentsProvider>(context, listen: false);
      final res = isNew
          ? await residentsProv.registerSpace(residentsModel)
          : await residentsProv.updateSpace(residentsModel);
      if (res == null) {
        await CustomModals().showError(
          message: isNew ? 'Espacio registrado exitosamente' : 'Espacio actualizado exitosamente',
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
  }
}
