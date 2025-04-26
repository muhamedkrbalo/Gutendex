part of 'service_locator_imports.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());

  sl.registerLazySingleton<AppInterceptors>(() => AppInterceptors());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerFactory<ApiConsumer>(() => DioConsumer(client: sl()));

  //! home
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()));

  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(Hive.box(Constants.booksBox)));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(sl(), sl()));

  //! useCase
  sl.registerLazySingleton<BooksUseCase>(() => BooksUseCase(sl()));

  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
