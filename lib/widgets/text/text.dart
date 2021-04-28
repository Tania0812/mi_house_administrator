import 'package:flutter/material.dart';

const tableTitleStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.w700);

class CustomText extends StatelessWidget {
  final String text;
  final bool isTitle;

  const CustomText({Key? key, required this.text, this.isTitle = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SelectableText(text, style: isTitle ? tableTitleStyle : null),
    );
  }
}
