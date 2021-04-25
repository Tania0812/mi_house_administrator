import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/util/app_state.dart';

class CustomModals {
  final context = appContext.context as BuildContext;
  Future<void> showErrorModal({
    required String message,
    String title = 'Oops ha ocurrido un error',
    VoidCallback? onPressed,
    VoidCallback? confirmButtonAction,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
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
}
