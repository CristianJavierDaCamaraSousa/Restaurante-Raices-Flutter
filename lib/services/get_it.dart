import 'package:get_it/get_it.dart';
import 'package:restaurante_raices/services/repository/usuario_repository.dart';

import 'repository/database.dart';

GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => Database());
  getIt.registerLazySingleton(() => UsuarioRepository());

  //getIt.registerLazySingleton(() => StreamProvider(create: (_) => getIt.get<UsuarioRepository>().streamMensajes, initialData: ""));
}
