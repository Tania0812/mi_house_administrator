//DI
import 'package:get_it/get_it.dart';
import 'package:mi_house_administrator/core/db/database.dart';
import 'package:mi_house_administrator/core/requests/http_handler.dart';
import 'package:mi_house_administrator/core/token/token.dart';
import 'package:mi_house_administrator/features/auth/auth_provider.dart';

final sl = GetIt.instance;

void setupDI() {
  sl.allowReassignment = true;

  //Provider
  sl.registerFactory<AuthProvider>(() => AuthProvider(token: sl(), httpHandler: sl()));

  //Data Sources
  //registerLazySingleton<Type>(()=>Object)

  //Repository
  //registerLazySingleton<Type>(()=>Object)

  //Core-External
  //registerLazySingleton<Type>(()=>Object)
  sl.registerLazySingleton<Database>(() => Database());
  sl.registerLazySingleton<Token>(() => Token(dbClient: sl()));
  sl.registerLazySingleton<HttpHandler>(() => HttpHandlerImpl(token: sl()));
}
