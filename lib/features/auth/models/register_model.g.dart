// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) {
  return RegisterModel(
    document: json['document'] as String,
    name: json['name'] as String,
    lastname: json['lastname'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
    repeatpassword: json['repeatpassword'] as String,
  );
}

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'document': instance.document,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'password': instance.password,
      'repeatpassword': instance.repeatpassword,
    };
