import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/features/residents/residents_provider.dart';
import 'package:mi_house_administrator/screens/residents/residents_form.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';
import 'package:mi_house_administrator/widgets/text/text.dart';
import 'package:provider/provider.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({Key? key}) : super(key: key);

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
                'Residentes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(ResidentsFormScreen.route),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                  child: const Text('+ Nuevo residente'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: residentsProv.fetchResidents(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if ((snapshot.data as Failure?) != null) {
                  return Center(child: Text((snapshot.data! as Failure).message));
                }
                return Table(
                  columnWidths: const {
                    0: FractionColumnWidth(0.05),
                    3: FractionColumnWidth(0.06),
                    7: FractionColumnWidth(0.16),
                  },
                  children: [
                    const TableRow(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey)),
                      ),
                      children: [
                        CustomText(text: '#', isTitle: true),
                        CustomText(text: 'Nombres', isTitle: true),
                        CustomText(text: 'Apellidos', isTitle: true),
                        CustomText(text: 'Torre', isTitle: true),
                        CustomText(text: 'Apartamento', isTitle: true),
                        CustomText(text: 'Documento', isTitle: true),
                        CustomText(text: 'Estado', isTitle: true),
                        CustomText(text: '', isTitle: true),
                      ],
                    ),
                    ...residentsProv.residentsResponse!.data
                        .map(
                          (e) => TableRow(
                            children: [
                              CustomText(text: e.id.toString()),
                              CustomText(text: e.nombres),
                              CustomText(text: e.apellidos),
                              CustomText(text: e.bloque ?? ''),
                              CustomText(text: e.apto ?? ''),
                              CustomText(text: e.documento),
                              const CustomText(text: 'Activo'),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () => Navigator.of(context).pushNamed(
                                      ResidentsFormScreen.route,
                                      arguments: e,
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => residentsProv.deleteResidents(e.email),
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
