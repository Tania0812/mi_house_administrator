import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String document;
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String repeatpassword;

  RegisterModel({required this.document, required this.name, required this.lastname, required this.email, required this.password, required this.repeatpassword});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}