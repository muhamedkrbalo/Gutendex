import 'package:gutendex/features/home/data/model/author_model.dart';
import 'package:gutendex/features/home/data/model/formats_model.dart';
import 'package:gutendex/features/home/domain/entity/book_data_entity.dart';

class BookDataModel extends BookDataEntity {
  const BookDataModel({
    super.id,
    super.title,
    super.authors,
    super.summaries,
    super.formats,
  });

  factory BookDataModel.fromJson(Map<String, dynamic> json) {
    return BookDataModel(
      id: json['id'],
      title: json['title'],
      authors: (json['authors'] as List?)
          ?.map((e) => AuthorModel.fromJson(e))
          .toList(),
      summaries: (json['summaries'] as List?)?.cast<String>(),
      formats: json['formats'] != null
          ? FormatsModel.fromJson(json['formats'])
          : null,
    );
  }
}
