import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';
import 'package:hive/hive.dart';

abstract class LocalDataSource {
  Future<void> cacheBooks(List<BookDataEntity> books);
  Future<List<BookDataEntity>> getCachedBooks();
}

class LocalDataSourceImpl implements LocalDataSource {
  final Box<BookDataEntity> booksBox;

  LocalDataSourceImpl(this.booksBox);

  @override
  Future<void> cacheBooks(List<BookDataEntity> books) async {
    await booksBox.clear();
    for (var i = 0; i < books.length; i++) {
      await booksBox.put(i, books[i]);
    }
  }

  @override
  Future<List<BookDataEntity>> getCachedBooks() async {
    return booksBox.values.toList();
  }
}
