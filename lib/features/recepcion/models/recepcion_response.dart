import 'package:json_annotation/json_annotation.dart';

part 'recepcion_response.g.dart';

@JsonSerializable()
class RecepcionResponse {
  RecepcionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Recepcion> data;

  factory RecepcionResponse.fromJson(Map<String, dynamic> json) =>
      _$RecepcionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecepcionResponseToJson(this);
}

@JsonSerializable()
class Recepcion {
  Recepcion({
    this.apto,
    this.bloque,
    this.turno,
    required this.id,
    required this.tipoDoc,
    required this.documento,
    required this.nombres,
    required this.apellidos,
    required this.fechaNac,
    required this.email,
    required this.createdAt,
    required this.password,
    required this.vivienda,
    required this.reportes,
    required this.comunicados,
    required this.reservas,
    required this.conjunto,
    required this.roles,
  });

  final int id;
  final String tipoDoc;
  final String documento;
  final String nombres;
  final String apellidos;
  final String? apto;
  final String? bloque;
  final DateTime fechaNac;
  final String email;
  final DateTime createdAt;
  final String password;
  final String? turno;
  final List vivienda;
  final List reportes;
  final List comunicados;
  final List reservas;
  final Conjunto conjunto;
  final List<Role> roles;

  factory Recepcion.fromJson(Map<String, dynamic> json) => _$RecepcionFromJson(json);

  Map<String, dynamic> toJson() => _$RecepcionToJson(this);

  @override
  String toString() {
    return 'Recepcion(id: $id, tipoDoc: $tipoDoc, documento: $documento, nombres: $nombres, apellidos: $apellidos, apto: $apto, bloque: $bloque, fechaNac: $fechaNac, email: $email, createdAt: $createdAt, password: $password, turno: $turno, vivienda: $vivienda, reportes: $reportes, comunicados: $comunicados, reservas: $reservas, conjunto: $conjunto, roles: $roles)';
  }
}

@JsonSerializable()
class Conjunto {
  Conjunto({
    required this.id,
    required this.nombre,
    this.direccion,
    required this.usuario,
    required this.bloques,
  });

  final int id;
  final String nombre;
  final String? direccion;
  final List usuario;
  final List bloques;

  factory Conjunto.fromJson(Map<String, dynamic> json) => _$ConjuntoFromJson(json);

  Map<String, dynamic> toJson() => _$ConjuntoToJson(this);
}

@JsonSerializable()
class Role {
  Role({required this.id, required this.name});

  final int id;
  final String name;

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
