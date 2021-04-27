import 'package:flutter/material.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';
import 'package:mi_house_administrator/features/ui/home_ui_provider.dart';
import 'package:mi_house_administrator/screens/home/home_tab.dart';
import 'package:mi_house_administrator/screens/home/recepcion_tab.dart';
import 'package:mi_house_administrator/screens/home/users_tab.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final homeUiProv = Provider.of<HomeUiProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              width: isLarge ? 190 : 100,
              height: size.height,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  const Icon(Icons.home, color: Colors.white, size: 60),
                  isLarge
                      ? const Text(
                          'Mi House',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )
                      : Column(
                          children: const [
                            Text(
                              'Mi',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'House',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                  const Spacer(),
                  ...menuItems.asMap().entries.map(
                    (entry) {
                      final i = entry.key;
                      final e = entry.value;
                      return DrawerButton(
                        icon: e.icon,
                        text: e.name,
                        index: i,
                      );
                    },
                  ).toList(),
                  const Spacer(),
                  DrawerButton(
                    icon: Icons.exit_to_app,
                    text: 'Salir',
                    index: 99,
                    onTap: () =>Provider.of<AuthProvider>(context, listen: false).logout(),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: IndexedStack(
                index: homeUiProv.selectedIndex,
                children: const [
                  HomeTab(),
                  UsersTab(),
                  RecepcionTab(),
                  Text('4'),
                  Text('5'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.index,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final int index;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isLarge = size.width > 1024;
    final homeUIProv = Provider.of<HomeUiProvider>(context);
    final bool isSelected = index == homeUIProv.selectedIndex;

    return InkWell(
      onTap: onTap ?? () => homeUIProv.onChangeSelectedItem(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: isLarge ? 50 : 50,
        width: isLarge ? 150 : 50,
        padding: isLarge
            ? const EdgeInsets.symmetric(vertical: 10, horizontal: 12)
            : const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white.withOpacity(0.2) : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isLarge ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            if (isLarge) ...[
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ]
          ],
        ),
      ),
    );
  }
}
