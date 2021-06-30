// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conjuntoregister_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConjuntoRegisterModel _$ConjuntoRegisterModelFromJson(
    Map<String, dynamic> json) {
  return ConjuntoRegisterModel(
    nombre: json['nombre'] as String,
    direccion: json['direccion'] as String,
    cantBloques: json['cantBloques'] as String,
    cantAptosPorBloque: json['cantAptosPorBloque'] as String,
    aptosPorPiso: json['aptosPorPiso'] as String,
    pisos: json['pisos'] as String,
  );
}

Map<String, dynamic> _$ConjuntoRegisterModelToJson(
        ConjuntoRegisterModel instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'direccion': instance.direccion,
      'cantBloques': instance.cantBloques,
      'cantAptosPorBloque': instance.cantAptosPorBloque,
      'aptosPorPiso': instance.aptosPorPiso,
      'pisos': instance.pisos,
    };
