import 'package:get_it/get_it.dart';

import 'institute_cubit/institute_cubit.dart';
import 'network/dio_client.dart';
import 'repositories/institute_repository/institute_repository.dart';
import 'repositories/institute_repository/institute_repository_impl.dart';
import 'services/institute_service/institute_service.dart';
import 'services/institute_service/institute_service_impl.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Core
  locator.registerLazySingleton(() => DioClient());

  // Services
  locator.registerLazySingleton<InstituteService>(
    () => InstituteServiceImpl(dioClient: locator<DioClient>()),
  );

  // Repositories
  locator.registerLazySingleton<InstituteRepository>(
    () =>
        InstituteRepositoryImpl(instituteService: locator<InstituteService>()),
  );
  // for shared state across the app
  locator.registerLazySingleton<InstituteCubit>(
    () => InstituteCubit(repository: locator<InstituteRepository>()),
  );
}
