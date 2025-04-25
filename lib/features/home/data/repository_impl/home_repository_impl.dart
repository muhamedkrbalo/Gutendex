import 'package:dio/dio.dart';
import 'package:gutendex/features/home/data/data_source/local_data_source/home_local_data_source.dart';
import 'package:gutendex/features/home/data/model/books_params.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';

import '../data_source/remote_data_source/home_remote_data_source.dart';
import '../../domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/book_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  const HomeRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, BooksEntity>> getBooks(
      {required BooksParams booksParams}) async {
    try {
      final books = await remoteDataSource.getBooks(booksParams: booksParams);

      if (booksParams.pageNumber == 1 && books.results != null) {
        await localDataSource.cacheBooks(books.results!);
      } else if (books.results != null) {
        final cachedBooks = await localDataSource.getCachedBooks();
        final updatedBooks = List<BookDataEntity>.from(cachedBooks)
          ..addAll(books.results!);
        await localDataSource.cacheBooks(updatedBooks);
      }

      return Right(books);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        final cachedBooks = await localDataSource.getCachedBooks();
        return Right(BooksEntity(
          results: cachedBooks,
          count: cachedBooks.length,
          isOfflineData: true,
        ));
      }
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
