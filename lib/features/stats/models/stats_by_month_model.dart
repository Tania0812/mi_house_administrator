import 'package:json_annotation/json_annotation.dart';

part 'stats_by_month_model.g.dart';

@JsonSerializable()
class StatsByMonthResponse {
  StatsByMonthResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final Data data;

  factory StatsByMonthResponse.fromJson(Map<String, dynamic> json) =>
      _$StatsByMonthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StatsByMonthResponseToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.ene = '0',
    this.feb = '0',
    this.mar = '0',
    this.abr = '0',
    this.may = '0',
    this.jun = '0',
    this.jul = '0',
    this.ago = '0',
    this.sep = '0',
    this.oct = '0',
    this.nov = '0',
    this.dic = '0',
  });

  final String? ene;
  final String? feb;
  final String? mar;
  final String? abr;
  final String? may;
  final String? jun;
  final String? jul;
  final String? ago;
  final String? sep;
  final String? oct;
  final String? nov;
  final String? dic;

  int getMaxValue() {
    int max = 0;
    for (final i in [ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic]) {
      final val = int.tryParse(i ?? '0')!;
      if (val > max) {
        max = val;
      }
    }
    return max;
  }

  List<GraphValues> getByMonthNumber() {
    return [
      GraphValues(numberMonth: 1, users: int.tryParse(ene ?? '0')!),
      GraphValues(numberMonth: 2, users: int.tryParse(feb ?? '0')!),
      GraphValues(numberMonth: 3, users: int.tryParse(mar ?? '0')!),
      GraphValues(numberMonth: 4, users: int.tryParse(abr ?? '0')!),
      GraphValues(numberMonth: 5, users: int.tryParse(may ?? '0')!),
      GraphValues(numberMonth: 6, users: int.tryParse(jun ?? '0')!),
      GraphValues(numberMonth: 7, users: int.tryParse(jul ?? '0')!),
      GraphValues(numberMonth: 8, users: int.tryParse(ago ?? '0')!),
      GraphValues(numberMonth: 9, users: int.tryParse(sep ?? '0')!),
      GraphValues(numberMonth: 10, users: int.tryParse(oct ?? '0')!),
      GraphValues(numberMonth: 11, users: int.tryParse(nov ?? '0')!),
      GraphValues(numberMonth: 12, users: int.tryParse(dic ?? '0')!),
    ];
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

class GraphValues {
  final int numberMonth;
  final int users;

  GraphValues({required this.numberMonth, required this.users});
}
