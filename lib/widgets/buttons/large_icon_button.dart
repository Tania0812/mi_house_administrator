import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LargeIconButton extends StatelessWidget {
  const LargeIconButton({Key? key, required this.iconData, required this.text}) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(primary: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(iconData, color: Colors.black),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
