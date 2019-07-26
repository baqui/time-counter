import 'package:get_it/get_it.dart';

import 'core/services/api.dart';
import 'core/services/authentication.dart';

import 'ui/scenes/home/home_viewmodel.dart';
import 'ui/scenes/login/login_viewmodel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Authentication());
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
}
