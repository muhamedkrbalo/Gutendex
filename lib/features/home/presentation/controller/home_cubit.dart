import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gutendex/core/enum/cubit_state/cubit_state.dart';
import 'package:gutendex/features/home/data/model/books_params.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';
import 'package:gutendex/features/home/domain/useCase/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BooksUseCase getBooksUseCase;
  HomeCubit(this.getBooksUseCase) : super(const HomeState());

  int _pageNumberBooks = 1;
  bool isLastPageBooks = false;
  List<BookDataEntity> booksList = [];
  Future<void> getBooks({String? search}) async {
    if (_pageNumberBooks == 1) {
      emit(state.copyWith(getBooksStatus: CubitStatus.loading));
    } else {
      emit(state.copyWith(paginateBooksStatus: CubitStatus.loading));
    }

    final result = await getBooksUseCase
        .call(BooksParams(pageNumber: _pageNumberBooks, search: search));
    result.fold(
      (failure) {
        emit(state.copyWith(getBooksStatus: CubitStatus.failure));
      },
      (books) {
        booksList.addAll(books.results ?? []);
        if (booksList.length == books.count) {
          isLastPageBooks = true;
          emit(state.copyWith(paginateBooksStatus: CubitStatus.success));
        } else {
          _pageNumberBooks++;
          emit(state.copyWith(paginateBooksStatus: CubitStatus.success));
        }
        emit(state.copyWith(
          getBooksStatus: CubitStatus.success,
          books: booksList,
          isOfflineData: books.isOfflineData,
        ));
      },
    );
  }

  Future<void> resetBooks() async {
    _pageNumberBooks = 1;
    booksList = [];
    isLastPageBooks = false;
    emit(state.copyWith(books: []));
  }
}
