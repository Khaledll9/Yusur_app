import 'package:get_it/get_it.dart';

import 'network/dio_client.dart';
import 'repositories/course_repository/course_repository.dart';
import 'repositories/course_repository/course_repository_impl.dart';
import 'repositories/institute_repository/institute_repository.dart';
import 'repositories/institute_repository/institute_repository_impl.dart';
import 'services/course_service/course_service.dart';
import 'services/course_service/course_service_impl.dart';
import 'services/institute_service/institute_service.dart';
import 'services/institute_service/institute_service_impl.dart';
import 'view_models/course_cubit/course_cubit.dart';
import 'view_models/institute_cubit/institute_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Core
  locator.registerLazySingleton(() => DioClient());

  locator.registerLazySingleton<InstituteService>(
    () => InstituteServiceImpl(dioClient: locator<DioClient>()),
  );

  locator.registerLazySingleton<InstituteRepository>(
    () =>
        InstituteRepositoryImpl(instituteService: locator<InstituteService>()),
  );
  locator.registerLazySingleton<InstituteCubit>(
    () => InstituteCubit(repository: locator<InstituteRepository>()),
  );
  locator.registerLazySingleton<CourseService>(
    () => CourseServiceImpl(dioClient: locator<DioClient>()),
  );

  locator.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(courseService: locator<CourseService>()),
  );

  locator.registerLazySingleton<CourseCubit>(
    () => CourseCubit(repository: locator<CourseRepository>()),
  );
}
