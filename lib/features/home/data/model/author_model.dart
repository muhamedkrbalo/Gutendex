import 'package:gutendex/features/home/domain/entity/author_entity.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    super.name,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'],
    );
  }
}
