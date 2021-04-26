import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final width = isLarge ? size.width - 270 : size.width - 170;
    return Row(
      children: [
        Container(
          width: width * 0.4,
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 1)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Busca por residente, eventos, etc.',
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              Icon(Icons.search, color: Theme.of(context).primaryColor),
            ],
          ),
        ),
        const Spacer(),
        const IconWithBox(icon: Icons.notifications),
        const SizedBox(width: 15),
        const IconWithBox(icon: Icons.settings),
      ],
    );
  }
}

class IconWithBox extends StatelessWidget {
  const IconWithBox({Key? key, required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5))],
      ),
      child: Icon(
        icon,
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
    );
  }
}
