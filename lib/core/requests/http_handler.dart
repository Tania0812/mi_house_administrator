import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mi_house_administrator/core/constants/api_constants.dart';
import 'package:mi_house_administrator/core/token/token.dart';

abstract class HttpHandler {
  Future<Map<String, dynamic>> performGet(
    String endpoint, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performPost(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performPut(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });

  Future<Map<String, dynamic>> performDelete(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  });
}

class HttpHandlerImpl implements HttpHandler {
  final Token token;

  HttpHandlerImpl({required this.token});

  @override
  Future<Map<String, dynamic>> performGet(
    String endpoint, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
      );
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      printLogs(body: res.body, type: 'GET', endpoint: endpoint, statusCode: res.statusCode);
      if (isFailed(res.statusCode)) {
        throw Exception(decodedRes['message'] as String);
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performDelete(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.delete(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      printLogs(body: res.body, type: 'DELETE', endpoint: endpoint, statusCode: res.statusCode);
      if (isFailed(res.statusCode)) {
        throw Exception(decodedRes['message'] as String);
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performPost(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      printLogs(body: res.body, type: 'POST', endpoint: endpoint, statusCode: res.statusCode);
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      if (isFailed(res.statusCode)) {
        throw Exception(decodedRes['message'] as String);
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> performPut(
    String endpoint,
    Map<String, dynamic> body, {
    bool withToken = true,
  }) async {
    try {
      final res = await http.put(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: getHeaders(withToken: withToken),
        body: json.encode(body),
      );
      printLogs(body: res.body, type: 'PUT', endpoint: endpoint, statusCode: res.statusCode);
      final decodedRes = json.decode(res.body) as Map<String, dynamic>;
      if (isFailed(res.statusCode)) {
        throw Exception(decodedRes['message'] as String);
      }
      return decodedRes;
    } catch (_) {
      rethrow;
    }
  }

  bool isFailed(int statusCode) => statusCode < 200 && statusCode >= 300;

  Map<String, String> getHeaders({required bool withToken}) {
    final headersBase = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    if (withToken) {
      if (token.token == null) {
        throw Exception('El usuario no tiene un Token');
      }
      headersBase['Bearer-Token'] = token.token!;
    }
    return headersBase;
  }

  void printLogs({
    required int statusCode,
    required String body,
    required String endpoint,
    required String type,
  }) {
    log('#########################################################');
    log('API RESPONSE');
    log('#########################################################');
    log('Type: $type');
    log('Token: ${token.token ?? "NO TOKEN"}');
    log('For: $endpoint');
    log('Statuscode: $statusCode');
    log('Response: $body');
    log('#########################################################');
  }
}
