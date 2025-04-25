import 'package:hive/hive.dart';

part 'formats_entity.g.dart';

@HiveType(typeId: 2)
class FormatsEntity {
  @HiveField(0)
  final String? image;

  FormatsEntity({
    this.image,
  });
}
