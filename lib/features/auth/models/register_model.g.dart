// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    tipoDoc: json['tipoDoc'] as String,
    document: json['document'] as String,
    name: json['name'] as String,
    lastname: json['lastname'] as String,
    fechaNac: json['fechaNac'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    repeatpassword: json['repeatpassword'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) => <String, dynamic>{
      'tipoDoc': instance.tipoDoc,
      'document': instance.document,
      'name': instance.name,
      'lastname': instance.lastname,
      'fechaNac': instance.fechaNac,
      'email': instance.email,
      'password': instance.password,
      'repeatpassword': instance.repeatpassword,
    };
