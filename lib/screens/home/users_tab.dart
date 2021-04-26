import 'package:flutter/material.dart';
import 'package:mi_house_administrator/widgets/appbar/appbar.dart';

class UsersTab extends StatelessWidget {
  const UsersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomAppBar(),
        Container(),
      ],
    );
  }
}
