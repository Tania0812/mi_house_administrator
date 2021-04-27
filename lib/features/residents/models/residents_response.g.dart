// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residents_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidentsResponse _$ResidentsResponseFromJson(Map<String, dynamic> json) {
  return ResidentsResponse(
    status: json['status'] as String,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => Residents.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResidentsResponseToJson(ResidentsResponse instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Residents _$ResidentsFromJson(Map<String, dynamic> json) {
  return Residents(
    id: json['id'] as int,
    tipoDoc: json['tipoDoc'] as String,
    documento: json['documento'] as String,
    nombres: json['nombres'] as String,
    apellidos: json['apellidos'] as String,
    apto: json['apto'] as String?,
    bloque: json['bloque'] as String?,
    fechaNac: DateTime.parse(json['fechaNac'] as String),
    email: json['email'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    password: json['password'] as String,
    turno: json['turno'] as String?,
    vivienda: json['vivienda'] as List<dynamic>,
    reportes: json['reportes'] as List<dynamic>,
    comunicados: json['comunicados'] as List<dynamic>,
    reservas: json['reservas'] as List<dynamic>,
    conjunto: Conjunto.fromJson(json['conjunto'] as Map<String, dynamic>),
    roles: (json['roles'] as List<dynamic>)
        .map((e) => Role.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ResidentsToJson(Residents instance) => <String, dynamic>{
      'id': instance.id,
      'tipoDoc': instance.tipoDoc,
      'documento': instance.documento,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'apto': instance.apto,
      'bloque': instance.bloque,
      'fechaNac': instance.fechaNac.toIso8601String(),
      'email': instance.email,
      'createdAt': instance.createdAt.toIso8601String(),
      'password': instance.password,
      'turno': instance.turno,
      'vivienda': instance.vivienda,
      'reportes': instance.reportes,
      'comunicados': instance.comunicados,
      'reservas': instance.reservas,
      'conjunto': instance.conjunto,
      'roles': instance.roles,
    };

Conjunto _$ConjuntoFromJson(Map<String, dynamic> json) {
  return Conjunto(
    id: json['id'] as int,
    nombre: json['nombre'] as String,
    direccion: json['direccion'] as String?,
    usuario: json['usuario'] as List<dynamic>?,
    bloques: json['bloques'] as List<dynamic>?,
  );
}

Map<String, dynamic> _$ConjuntoToJson(Conjunto instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'direccion': instance.direccion,
      'usuario': instance.usuario,
      'bloques': instance.bloques,
    };

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
