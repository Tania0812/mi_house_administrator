import 'package:json_annotation/json_annotation.dart';

part 'residents_model.g.dart';

@JsonSerializable()
class ResidentsModel {
  final String tipoDoc;
  final String documento;
  final String nombres;
  final String apellidos;
  final String fechaNac;
  final String email;
  final String password;
  final String repeatPassword;
  final String apto;
  final String bloque;

  ResidentsModel({
    required this.apto,
    required this.bloque,
    required this.tipoDoc,
    required this.documento,
    required this.nombres,
    required this.apellidos,
    required this.fechaNac,
    required this.email,
    required this.password,
    required this.repeatPassword,
  });

  factory ResidentsModel.fromJson(Map<String, dynamic> json) => _$ResidentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResidentsModelToJson(this);
}
