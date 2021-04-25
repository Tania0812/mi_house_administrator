import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/date_utils.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final width = isLarge ? size.width - 270 : size.width - 170;
    // return Row(
    //   children: [
    //     Container(
    //       color: Colors.blueGrey,
    //       width: width * 0.65,
    //     ),
    //     Container(
    //       color: Colors.red,
    //       width: width * 0.35,
    //     ),
    //   ],
    // );
    return Column(
      children: const [
        _AppBar(),
        PresentationCard(),
      ],
    );
  }
}

class PresentationCard extends StatelessWidget {
  const PresentationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final width = isLarge ? size.width - 270 : size.width - 170;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: width,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withRed(80),
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset('assets/images/ilustrations/home_ilustration.png'),
            ),
          ),
          Positioned(
            top: 30,
            left: 30,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    CustomDateUtils.getFormattedDate(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 30,
            child: Text(
              '¡Buenos ${CustomDateUtils.getGreeting()}, Paola!',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
          const Positioned(
            bottom: 20,
            left: 30,
            child: Text(
              'Administrador(a)',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    Key? key,
  }) : super(key: key);

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
        const SizedBox(width: 8),
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
