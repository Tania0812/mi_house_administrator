// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpacesModel _$SpacesModelFromJson(Map<String, dynamic> json) {
  return SpacesModel(
    nombre: json['nombre'] as String,
    disponible: json['disponible'] as bool,
    precio: json['precio'] as int,
    aforo: json['aforo'] as int,
    conjunto: json['conjunto'] as String,
    tipo: json['tipo'] as String,
  );
}

Map<String, dynamic> _$SpacesModelToJson(SpacesModel instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'disponible': instance.disponible,
      'precio': instance.precio,
      'aforo': instance.aforo,
      'conjunto': instance.conjunto,
      'tipo': instance.tipo,
    };
