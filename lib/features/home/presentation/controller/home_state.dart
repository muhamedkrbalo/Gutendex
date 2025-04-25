part of 'home_cubit.dart';

class HomeState extends Equatable {
  final CubitStatus getBooksStatus;
  final CubitStatus paginateBooksStatus;
  final List<BookDataEntity> books;
  final bool isOfflineData;

  const HomeState({
    this.getBooksStatus = CubitStatus.initial,
    this.paginateBooksStatus = CubitStatus.initial,
    this.books = const [],
    this.isOfflineData = false,
  });

  HomeState copyWith({
    CubitStatus? getBooksStatus,
    CubitStatus? paginateBooksStatus,
    List<BookDataEntity>? books,
    bool? isOfflineData,
  }) {
    return HomeState(
      getBooksStatus: getBooksStatus ?? this.getBooksStatus,
      paginateBooksStatus: paginateBooksStatus ?? this.paginateBooksStatus,
      books: books ?? this.books,
      isOfflineData: isOfflineData ?? this.isOfflineData,
    );
  }

  @override
  List<Object> get props =>
      [getBooksStatus, paginateBooksStatus, books, isOfflineData];
}
