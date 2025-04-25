import 'package:dartz/dartz.dart';
import 'package:gutendex/features/home/data/model/books_params.dart';
import '../../../../core/error/failures.dart';
import '../entity/book_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, BooksEntity>> getBooks(
      {required BooksParams booksParams});
}
