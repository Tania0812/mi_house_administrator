import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
        child: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColorLight,
          size: 30,
        ),
      ),
    );
  }
}
