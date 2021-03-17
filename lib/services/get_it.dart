import 'package:get_it/get_it.dart';

import 'database.dart';

GetIt getIt = GetIt.instance;

void setup() async {
  getIt.registerFactory<Database>(() => Database());
}
