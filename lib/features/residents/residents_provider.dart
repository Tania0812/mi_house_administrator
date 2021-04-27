import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/residents/models/residents_model.dart';
import 'package:mi_house_administrator/features/residents/models/residents_response.dart';
import 'package:mi_house_administrator/features/stats/models/stats_by_month_model.dart';

class ResidentsProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;
  ResidentsResponse? residentsResponse;
  StatsByMonthResponse? statsByMonth;

  ResidentsProvider({required this.httpHandler, required this.token});

  Future<Failure?> registerResident(ResidentsModel residentsModel) async {
    try {
      await httpHandler.performPost(
        '/registro/residente',
        residentsModel.toJson(),
        withToken: false,
      );
      fetchResidents();
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Failure?> fetchResidents() async {
    try {
      final res = await httpHandler.performGet('/residentes/lista');
      residentsResponse = ResidentsResponse.fromJson(res);
      return null;
    } on Failure catch (e) {
      return e;
    } on SocketException catch (_) {
      return Failure(message: 'Ha ocurrido un problema, intentalo mas tarde');
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  Future<Failure?> fetchResidentsStats() async {
    try {
      if (statsByMonth != null) {
        return null;
      }
      final res = await httpHandler.performGet('/residentes/por_mes');
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
