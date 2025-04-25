import 'package:gutendex/features/home/data/model/book_data_model.dart';
import 'package:gutendex/features/home/domain/entity/book_entity.dart';

class BooksModel extends BooksEntity {
  const BooksModel({
    super.count,
    super.results,
    super.isOfflineData,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      count: json['count'],
      results: (json['results'] as List?)
          ?.map((e) => BookDataModel.fromJson(e))
          .toList(),
    );
  }
}
