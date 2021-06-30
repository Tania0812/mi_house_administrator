import 'package:json_annotation/json_annotation.dart';

part 'space_model.g.dart';

@JsonSerializable()
class SpacesModel {
  final String nombre;
  final bool disponible;
  final int precio;
  final int aforo;
  final String conjunto;
  final String tipo;

  SpacesModel({
    required this.nombre,
    required this.disponible,
    required this.precio,
    required this.aforo,
    required this.conjunto,
    required this.tipo,
  });

  factory SpacesModel.fromJson(Map<String, dynamic> json) => _$SpacesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpacesModelToJson(this);
}
