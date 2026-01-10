import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

import 'package:logger/logger.dart'; // Added

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(String environment) async => getIt.init(environment: environment);

@module
abstract class CoreModule {
  @lazySingleton
  Logger get logger => Logger();
}
