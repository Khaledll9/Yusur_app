import 'package:get_it/get_it.dart' show GetIt;
import 'package:yusur_app/repositories/institute_repository/institute_repository.dart';

import 'api/api_consumer.dart';
import 'repositories/institute_repository/institute_repository_impl.dart';
import 'view_models/institute_cubit/institute_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<InstituteRepository>(
    () => InstituteRepositoryImpl(apiConsumer: locator<ApiConsumer>()),
  );

  locator.registerFactory<InstituteCubit>(
    () => InstituteCubit(repository: locator<InstituteRepository>()),
  );
}
