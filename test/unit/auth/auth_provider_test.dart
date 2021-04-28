import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mi_house_administrator/core/db/database.dart';
import 'package:mi_house_administrator/core/failure/failure.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:test/test.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final database = Database();
  final token = Token(dbClient: database);
  group('Token managment testing', () {
    test('Save token', () async {
      await token.saveToken('12345');
      final res = await token.getToken();
      expect(res, '12345');
    });

    test('Replace old token for new', () async {
      await token.updateToken('789456');
      final res = await token.getToken();
      expect(res, '789456');
    });
    test('Delete token', () async {
      await token.deleteToken();
      try {
        await token.getToken();
      } on Failure catch (e) {
        expect(e.message, 'El usuario no tiene un Token');
      }
    });
  });
}
