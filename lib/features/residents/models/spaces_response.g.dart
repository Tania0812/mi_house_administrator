// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spaces_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpacesResponse _$SpacesResponseFromJson(Map<String, dynamic> json) {
  return SpacesResponse(
    status: json['status'] as String,
    message: json['message'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => Spaces.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SpacesResponseToJson(SpacesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Spaces _$SpacesFromJson(Map<String, dynamic> json) {
  return Spaces(
    nombre: json['nombre'] as String,
    precio: json['precio'] as String,
    aforo: json['aforo'] as String,
    tipo: json['tipo'] as String,
    conjunto: json['conjunto'] as String,
  );
}

Map<String, dynamic> _$SpacesToJson(Spaces instance) => <String, dynamic>{
      'nombre': instance.nombre,
      'precio': instance.precio,
      'aforo': instance.aforo,
      'tipo': instance.tipo,
      'conjunto': instance.conjunto,
    };
