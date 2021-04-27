import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/residents/models/residents_model.dart';

class ResidentsProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;

  ResidentsProvider({required this.httpHandler, required this.token});

  Future<Failure?> registerResident(ResidentsModel residentsModel) async {
    try {
      final res = await httpHandler.performPost(
        '/registro/residente',
        residentsModel.toJson(),
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
