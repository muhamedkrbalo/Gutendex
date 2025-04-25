import 'package:gutendex/features/home/domain/entity/formats_entity.dart';

class FormatsModel extends FormatsEntity {
  FormatsModel({
    super.image,
  });

  factory FormatsModel.fromJson(Map<String, dynamic> json) {
    return FormatsModel(
      image: json["image/jpeg"],
    );
  }
}
