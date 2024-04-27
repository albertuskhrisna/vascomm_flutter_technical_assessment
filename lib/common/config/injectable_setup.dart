import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable_setup.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  generateForDir: ['lib', 'test'],
)
Future<void> configureDependencies() async => $initGetIt(getIt);