import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'author_entity.g.dart';

@HiveType(typeId: 1)
class AuthorEntity extends Equatable {
  @HiveField(0)
  final String? name;

  const AuthorEntity({
    this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
