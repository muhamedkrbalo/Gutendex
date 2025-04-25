import 'package:gutendex/features/home/data/model/books_params.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/common/use_case/use_case.dart';
import '../repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import '../entity/book_entity.dart';

class BooksUseCase implements UseCase<BooksEntity, BooksParams> {
  final HomeRepository repository;

  BooksUseCase(this.repository);
  @override
  Future<Either<Failure, BooksEntity>> call(BooksParams params) async {
    return await repository.getBooks(booksParams: params);
  }
}
