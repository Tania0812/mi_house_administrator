import 'package:json_annotation/json_annotation.dart';
part 'spaces_response.g.dart';

@JsonSerializable()
class SpacesResponse {
  SpacesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final List<Spaces> data;

  factory SpacesResponse.fromJson(Map<String, dynamic> json) => _$SpacesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SpacesResponseToJson(this);
}

@JsonSerializable()
class Spaces {
  Spaces({
    required this.nombre,
    required this.precio,
    required this.aforo,
    required this.tipo,
    required this.conjunto,
  });

  final String nombre;
  final String precio;
  final String aforo;
  final String tipo;
  final String conjunto;

  factory Spaces.fromJson(Map<String, dynamic> json) => _$SpacesFromJson(json);

  Map<String, dynamic> toJson() => _$SpacesToJson(this);
}
