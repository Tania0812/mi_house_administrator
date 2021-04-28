import 'package:json_annotation/json_annotation.dart';

part 'recepcion_model.g.dart';

@JsonSerializable()
class RecepcionModel {
  final String tipoDoc;
  final String documento;
  final String nombres;
  final String apellidos;
  final String fechaNac;
  final String nombreConjunto;
  final String email;
  final String password;
  final String repeatPassword;

  RecepcionModel({
    required this.nombreConjunto,
    required this.tipoDoc,
    required this.documento,
    required this.nombres,
    required this.apellidos,
    required this.fechaNac,
    required this.email,
    required this.password,
    required this.repeatPassword,
  });

  factory RecepcionModel.fromJson(Map<String, dynamic> json) => _$RecepcionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecepcionModelToJson(this);
}
