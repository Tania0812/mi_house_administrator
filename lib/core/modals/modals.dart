import 'package:flutter/material.dart';

class CustomModals {
  Future<void> showError({
    required String message,
    String title = 'Oops ha ocurrido un error',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          //TODO: change colors
          ElevatedButton(
            onPressed: () => onPressed == null ? Navigator.of(context).pop() : onPressed(),
            child: const Text('Salir'),
          ),
          if (confirmButtonAction != null)
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                confirmButtonAction();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>((_) => Colors.red),
              ),
              child: const Text('Confirmar'),
            ),
        ],
      ),
    );
  }

  //TODO: crear modal de todo salio bien
}
