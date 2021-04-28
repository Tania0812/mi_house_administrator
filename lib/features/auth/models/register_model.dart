import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String tipoDoc;
  final String document;
  final String name;
  final String lastname;
  final String fechaNac;
  final String email;
  final String password;
  final String repeatpassword;

  RegisterModel({required this.tipoDoc, required this.document, required this.name, required this.lastname, required this.fechaNac, required this.email, required this.password, required this.repeatpassword});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}