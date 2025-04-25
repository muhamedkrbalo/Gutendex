import 'package:equatable/equatable.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';

class BooksEntity extends Equatable {
  final int? count;
  final List<BookDataEntity>? results;
  final bool? isOfflineData;

  const BooksEntity({
    this.count,
    this.results,
    this.isOfflineData = false,
  });

  @override
  List<Object?> get props => [count, results, isOfflineData];
}
