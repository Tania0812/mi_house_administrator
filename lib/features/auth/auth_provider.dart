import 'package:flutter/material.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/auth/models/login_model.dart';

enum AuthStates {
  initial,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  final HttpHandler httpHandler;
  final Token token;
  AuthStates state = AuthStates.initial;
  AuthProvider({required this.token, required this.httpHandler});

  Future<Failure?> login(LoginModel login) async {
    try {
      final res = await httpHandler.performPost('/login', login.toJson(), withToken: false);
      token.saveToken(res['token'] as String);
      state = AuthStates.authenticated;
      notifyListeners();
      return null;
    } on Failure catch (e) {
      return e;
    } catch (e) {
      return Failure(message: e.toString());
    }
  }

  //TODO: make Register: function, model
}
