import 'package:json_annotation/json_annotation.dart';

part 'conjuntoregister_model.g.dart';

@JsonSerializable()
class ConjuntoRegisterModel{
  final String nombre;
  final String direccion;
  final String cantBloques;
  final String cantAptosPorBloque;
  final String aptosPorPiso;
  final String pisos;

  ConjuntoRegisterModel({
    required this.nombre,
    required this.direccion,
    required this.cantBloques,
    required this.cantAptosPorBloque,
    required this.aptosPorPiso,
    required this.pisos,
  });

  factory ConjuntoRegisterModel.fromJson(Map<String, dynamic> json) => _$ConjuntoRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConjuntoRegisterModelToJson(this);
}