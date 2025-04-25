part of 'service_locator_imports.dart';

final sl = GetIt.instance;
Future<void> initDependencies() async {
  sl.registerLazySingleton<InternetConnection>(() => InternetConnection());

  sl.registerFactory<AppInterceptors>(() => AppInterceptors());
  sl.registerFactory<Dio>(() => Dio());
  sl.registerFactory<ApiConsumer>(() => DioConsumer(client: sl()));

  //! home
  sl.registerFactory<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(sl()));

  sl.registerFactory<LocalDataSource>(
      () => LocalDataSourceImpl(Hive.box(Constants.booksBox)));
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(sl(), sl()));

  //! useCase
  sl.registerFactory<BooksUseCase>(() => BooksUseCase(sl()));

  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
