import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:gutendex/features/home/domain/entity/author_entity.dart';
import 'package:gutendex/features/home/domain/entity/formats_entity.dart';

part 'book_data_entity.g.dart';

@HiveType(typeId: 0)
class BookDataEntity extends Equatable {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final List<AuthorEntity>? authors;
  @HiveField(3)
  final List<String>? summaries;
  @HiveField(4)
  final FormatsEntity? formats;

  const BookDataEntity({
    this.id,
    this.title,
    this.authors,
    this.summaries,
    this.formats,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        authors,
        summaries,
        formats,
      ];
}
