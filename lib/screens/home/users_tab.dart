import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';

const tableTitleStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.w700);

class UsersTab extends StatelessWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = Responsive.homeWidth();
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
                  onPressed: () {},
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
                  Text('#', style: tableTitleStyle),
                  Text('Nombres', style: tableTitleStyle),
                  Text('Apellidos', style: tableTitleStyle),
                  Text('Torre', style: tableTitleStyle),
                  Text('Apartamento', style: tableTitleStyle),
                  Text('Telefono', style: tableTitleStyle),
                  Text('Estado', style: tableTitleStyle),
                  Text('', style: tableTitleStyle),
                ],
              ),
              //TODO: add style and load data from API
              TableRow(
                children: [
                  const Text('0'),
                  const Text('Maria Jose'),
                  const Text('Bolaños Garcia'),
                  const Text('1'),
                  const Text('205'),
                  const Text('300 745 1247'),
                  const Text('Activo'),
                  Row(
                    children: [
                      IconButton(icon: const Icon(Icons.add), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
