import 'package:gutendex/core/network/api_consumer.dart';
import 'package:gutendex/core/network/end_points.dart';
import 'package:gutendex/features/home/data/model/book_model.dart';
import 'package:gutendex/features/home/data/model/books_params.dart';

abstract class HomeRemoteDataSource {
  Future<BooksModel> getBooks({required BooksParams booksParams});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer dio;

  HomeRemoteDataSourceImpl(this.dio);

  @override
  Future<BooksModel> getBooks({required BooksParams booksParams}) async {
    final response =
        await dio.get(EndPoints.books, queryParameters: booksParams.toJson());
    return BooksModel.fromJson(response);
  }
}
