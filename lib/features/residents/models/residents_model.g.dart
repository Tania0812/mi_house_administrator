// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidentsModel _$ResidentsModelFromJson(Map<String, dynamic> json) {
  return ResidentsModel(
    nombreConjunto: json['nombreConjunto'] as String,
    apto: json['apto'] as String,
    bloque: json['bloque'] as String,
    tipoDoc: json['tipoDoc'] as String,
    documento: json['documento'] as String,
    nombres: json['nombres'] as String,
    apellidos: json['apellidos'] as String,
    fechaNac: json['fechaNac'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    repeatPassword: json['repeatPassword'] as String,
  );
}

Map<String, dynamic> _$ResidentsModelToJson(ResidentsModel instance) =>
    <String, dynamic>{
      'tipoDoc': instance.tipoDoc,
      'documento': instance.documento,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'fechaNac': instance.fechaNac,
      'nombreConjunto': instance.nombreConjunto,
      'email': instance.email,
      'password': instance.password,
      'repeatPassword': instance.repeatPassword,
      'apto': instance.apto,
      'bloque': instance.bloque,
    };
