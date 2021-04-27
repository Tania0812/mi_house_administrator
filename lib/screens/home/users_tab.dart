import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/screens/residents/residents_form.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';
import 'package:mi_house_administrator/widgets/text/text.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Responsive.homeWidth(context);
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
          child: Table(
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
                  CustomText(text: 'Telefono', isTitle: true),
                  CustomText(text: 'Estado', isTitle: true),
                  CustomText(text: '', isTitle: true),
                ],
              ),
              //TODO: add style and load data from API
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
              TableRow(
                children: [
                  const CustomText(text: '0'),
                  const CustomText(text: 'Maria Jose'),
                  const CustomText(text: 'Bolaños Garcia'),
                  const CustomText(text: '1'),
                  const CustomText(text: '205'),
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
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
            ],
          ),
        )
      ],
    );
  }
}
