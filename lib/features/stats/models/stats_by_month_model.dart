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
    required this.ene,
    required this.feb,
    required this.mar,
    required this.abr,
    required this.may,
    required this.jun,
    required this.jul,
    required this.ago,
    required this.sep,
    required this.oct,
    required this.nov,
    required this.dic,
  });

  final String ene;
  final String feb;
  final String mar;
  final String abr;
  final String may;
  final String jun;
  final String jul;
  final String ago;
  final String sep;
  final String oct;
  final String nov;
  final String dic;

  int getMaxValue() {
    int max = 0;
    for (final i in [ene, feb, mar, abr, may, jun, jul, ago, sep, oct, nov, dic]) {
      final val = int.tryParse(i)!;
      if (val > max) {
        max = val;
      }
    }
    return max;
  }

  List<GraphValues> getByMonthNumber() {
    return [
      GraphValues(numberMonth: 1, users: int.tryParse(ene)!),
      GraphValues(numberMonth: 2, users: int.tryParse(feb)!),
      GraphValues(numberMonth: 3, users: int.tryParse(mar)!),
      GraphValues(numberMonth: 4, users: int.tryParse(abr)!),
      GraphValues(numberMonth: 5, users: int.tryParse(may)!),
      GraphValues(numberMonth: 6, users: int.tryParse(jun)!),
      GraphValues(numberMonth: 7, users: int.tryParse(jul)!),
      GraphValues(numberMonth: 8, users: int.tryParse(ago)!),
      GraphValues(numberMonth: 9, users: int.tryParse(sep)!),
      GraphValues(numberMonth: 10, users: int.tryParse(oct)!),
      GraphValues(numberMonth: 11, users: int.tryParse(nov)!),
      GraphValues(numberMonth: 12, users: int.tryParse(dic)!),
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
