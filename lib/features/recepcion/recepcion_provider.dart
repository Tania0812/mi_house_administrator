import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/recepcion/models/recepcion_model.dart';
import 'package:mi_house_administrator/features/recepcion/models/recepcion_response.dart';
import 'package:mi_house_administrator/features/stats/models/stats_by_month_model.dart';

class RecepcionProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;
  RecepcionResponse? recepcionResponse;
  StatsByMonthResponse? statsByMonth;

  RecepcionProvider({required this.httpHandler, required this.token});

  Future<Failure?> registerRecepcion(RecepcionModel recepcionModel) async {
    try {
      await httpHandler.performPost(
        '/registro/recepcion',
        recepcionModel.toJson(),
        withToken: false,
      );
      fetchRecepcion();
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Failure?> fetchRecepcion() async {
    try {
      final res = await httpHandler.performGet('/recepcion/lista');
      recepcionResponse = RecepcionResponse.fromJson(res);
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Failure?> fetchRecepcionStats() async {
    try {
      final res = await httpHandler.performGet('/recepcion/por_mes');
      statsByMonth = StatsByMonthResponse.fromJson(res);
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
