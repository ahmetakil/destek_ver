import 'package:get_it/get_it.dart';
import './page_service.dart';


GetIt locator = new GetIt();

void setupLocator() {
  locator.registerLazySingleton<PageService>(() => PageService());
}
