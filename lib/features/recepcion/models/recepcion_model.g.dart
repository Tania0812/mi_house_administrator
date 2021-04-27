// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recepcion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecepcionModel _$RecepcionModelFromJson(Map<String, dynamic> json) {
  return RecepcionModel(
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

Map<String, dynamic> _$RecepcionModelToJson(RecepcionModel instance) =>
    <String, dynamic>{
      'tipoDoc': instance.tipoDoc,
      'documento': instance.documento,
      'nombres': instance.nombres,
      'apellidos': instance.apellidos,
      'fechaNac': instance.fechaNac,
      'email': instance.email,
      'password': instance.password,
      'repeatPassword': instance.repeatPassword,
    };
