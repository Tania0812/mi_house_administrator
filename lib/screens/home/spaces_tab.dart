import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/residents/residents_provider.dart';
import 'package:mi_house_administrator/screens/residents/residents_form.dart';
import 'package:mi_house_administrator/screens/spaces/spaces_form.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';
import 'package:mi_house_administrator/widgets/text/text.dart';
import 'package:provider/provider.dart';

class SpacesTab extends StatelessWidget {
  const SpacesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Responsive.homeWidth(context);
    final residentsProv = Provider.of<ResidentsProvider>(context);
    return Column(
      children: [
        const CustomAppBar(),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: width,
          height: 50,
          child: Row(
            children: [
              const Text(
                'Espacios',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(SpacesFormScreen.route),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                  child: const Text('+ Nuevo espacio'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: residentsProv.fetchSpaces(Provider.of<AuthProvider>(context).auth!.conjunto!),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if ((snapshot.data as Failure?) != null) {
                  return Center(child: Text((snapshot.data! as Failure).message));
                }
                return Table(
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      children: [
                        CustomText(text: 'Nombre', isTitle: true),
                        CustomText(text: 'Precio', isTitle: true),
                        CustomText(text: 'Aforo', isTitle: true),
                        CustomText(text: 'Tipo', isTitle: true),
                        CustomText(text: 'Conjunto', isTitle: true),
                        CustomText(text: '', isTitle: true),
                      ],
                    ),
                    ...residentsProv.spacesResponse!.data
                        .map(
                          (e) => TableRow(
                            children: [
                              CustomText(text: e.nombre),
                              CustomText(text: e.precio),
                              CustomText(text: e.aforo),
                              CustomText(text: e.tipo),
                              CustomText(text: e.conjunto),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => Navigator.of(context).pushNamed(
                                      SpacesFormScreen.route,
                                      arguments: e,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {},
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                        .toList()
                  ],
                );
              }),
        ),
      ],
    );
  }
}
