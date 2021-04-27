import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/recepcion/models/recepcion_model.dart';

class RecepcionProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;

  RecepcionProvider({required this.httpHandler, required this.token});

  Future<Failure?> registerResident(RecepcionModel recepcionModel) async {
    try {
      final res = await httpHandler.performPost(
        '/registro/recepcion',
        recepcionModel.toJson(),
        withToken: false,
      );
      //TODO: Check response
      print(res);
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }
}
