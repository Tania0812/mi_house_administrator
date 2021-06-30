import 'package:json_annotation/json_annotation.dart';

part 'residents_response.g.dart';

@JsonSerializable()
class ResidentsResponse {
  ResidentsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Residents> data;

  factory ResidentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResidentsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentsResponseToJson(this);
}

@JsonSerializable()
class Residents {
  Residents({
    required this.id,
    required this.tipoDoc,
    required this.documento,
    required this.nombres,
    required this.apellidos,
    this.apto,
    this.bloque,
    required this.fechaNac,
    required this.email,
    required this.createdAt,
    required this.password,
    this.turno,
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
  final DateTime? createdAt;
  final String? password;
  final String? turno;
  final List<dynamic> vivienda;
  final List<dynamic>? reportes;
  final List<dynamic>? comunicados;
  final List<dynamic>? reservas;
  @JsonKey(name: 'conjuntoNombre')
  final String conjunto;
  final List<Role>? roles;

  factory Residents.fromJson(Map<String, dynamic> json) => _$ResidentsFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentsToJson(this);
}

@JsonSerializable()
class Conjunto {
  Conjunto({
    required this.id,
    required this.nombre,
    this.direccion,
    this.usuario,
    this.bloques,
  });

  final int id;
  final String nombre;
  final String? direccion;
  final List? usuario;
  final List? bloques;

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
