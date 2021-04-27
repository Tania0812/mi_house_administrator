import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/responsive.dart';
import 'package:mi_house_administrator/screens/recepcion/recepcion_form.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';
import 'package:mi_house_administrator/widgets/text/text.dart';

class RecepcionTab extends StatelessWidget {
  const RecepcionTab({Key? key}) : super(key: key);

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
              const Text('Recepción', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
              const Spacer(),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(RecepcionFormScreen.route),
                  style: ElevatedButton.styleFrom(primary: Theme.of(context).accentColor),
                  child: const Text('+ Nuevo recepción'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Table(
            columnWidths: const {0: FractionColumnWidth(0.05), 7: FractionColumnWidth(0.16)},
            children: [
              const TableRow(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
                children: [
                  CustomText(text: '#', isTitle: true),
                  CustomText(text: 'Nombres', isTitle: true),
                  CustomText(text: 'Apellidos', isTitle: true),
                  CustomText(text: 'Cargo', isTitle: true),
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
                  const CustomText(text: '300 745 1247'),
                  const CustomText(text: 'Activo'),
                  Row(
                    children: [
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
