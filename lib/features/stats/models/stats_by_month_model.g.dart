// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_by_month_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsByMonthResponse _$StatsByMonthResponseFromJson(Map<String, dynamic> json) {
  return StatsByMonthResponse(
    status: json['status'] as String,
    message: json['message'] as String,
    data: Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StatsByMonthResponseToJson(
        StatsByMonthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    ene: json['ene'] as String?,
    feb: json['feb'] as String?,
    mar: json['mar'] as String?,
    abr: json['abr'] as String?,
    may: json['may'] as String?,
    jun: json['jun'] as String?,
    jul: json['jul'] as String?,
    ago: json['ago'] as String?,
    sep: json['sep'] as String?,
    oct: json['oct'] as String?,
    nov: json['nov'] as String?,
    dic: json['dic'] as String?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ene': instance.ene,
      'feb': instance.feb,
      'mar': instance.mar,
      'abr': instance.abr,
      'may': instance.may,
      'jun': instance.jun,
      'jul': instance.jul,
      'ago': instance.ago,
      'sep': instance.sep,
      'oct': instance.oct,
      'nov': instance.nov,
      'dic': instance.dic,
    };
